note
	description: "Galaxy represents a game board in simodyssey."
	author: "Kevin B"
	date: "$Date$"
	revision: "$Revision$"

class
	GALAXY

inherit ANY
	redefine
		out
	end

create
	make

feature {NONE}
	moved_entities : ARRAY[TUPLE[ent : ENTITY; old_loc : COORDINATE; old_quad : INTEGER; new_quad : INTEGER]]
	dead_entities : ARRAY[ENTITY]

feature -- attributes

	grid: ARRAY2 [SECTOR]
			-- the board

	gen: RANDOM_GENERATOR_ACCESS

	shared_info_access : SHARED_INFORMATION_ACCESS

	shared_info: SHARED_INFORMATION
		attribute
			Result:= shared_info_access.shared_info
		end

	ship : SHIP

	planets : ARRAY[ENTITY]

feature --constructor

	make
		-- creates a dummy of galaxy grid
		local
			row, column : INTEGER
			planet_count : INTEGER
		do
			create moved_entities.make_empty
			create dead_entities.make_empty
			create planets.make_empty
			create ship.make(1, 1, 1)
			create grid.make_filled (create {SECTOR}.make_dummy, shared_info.number_rows, shared_info.number_columns)
			planet_count := 1
			from
				row := 1
			until
				row > shared_info.number_rows
			loop

				from
					column := 1
				until
					column > shared_info.number_columns
				loop
					grid[row,column] := create {SECTOR}.make(row,column, ship, planet_count)

					-- Check how many planets were added
					across grid[row, column].contents as i
					loop
						if attached i.item as quadrant then
							if quadrant.entity_type.item ~ 'P' then
								planets.force (quadrant, planet_count)
								planet_count := planet_count + 1
							end
						end
					end

					column:= column + 1;
				end
				row := row + 1
			end
			set_stationary_items
	end

feature --commands

	set_stationary_items
			-- distribute stationary items amongst the sectors in the grid.
			-- There can be only one stationary item in a sector
		local
			loop_counter : INTEGER
			temp_row, temp_column : INTEGER
			stationary_id : INTEGER
			check_sector: SECTOR
		do
			from
				loop_counter := 1
			until
				loop_counter > shared_info.number_of_stationary_items
			loop

				temp_row :=  gen.rchoose (1, shared_info.number_rows)
				temp_column := gen.rchoose (1, shared_info.number_columns)
				check_sector := grid[temp_row,temp_column]
				if (not check_sector.has_stationary) and (not check_sector.is_full) then
					stationary_id := -1 - loop_counter
					grid[temp_row,temp_column].put (create_stationary_item (temp_row, temp_column, stationary_id))
					loop_counter := loop_counter + 1
				end -- if
			end -- loop
		end -- feature set_stationary_items

	create_stationary_item (a_row, a_col, stationary_id : INTEGER) : ENTITY
			-- this feature randomly creates one of the possible types of stationary actors
		local
			chance: INTEGER
		do
			chance := gen.rchoose (1, 3)
			inspect chance
			when 1 then
				Result := create {STAR}.make_yellow_dwarf (a_row, a_col, stationary_id)
			when 2 then
				Result := create {STAR}.make_blue_giant (a_row, a_col, stationary_id)
			when 3 then
				Result := create {WORMHOLE}.make (a_row, a_col, stationary_id)
			end
		end

	move (obj : ENTITY; coord : COORDINATE) : BOOLEAN
		local
			index : INTEGER
		do
			if grid[coord.row, coord.col].is_full then

				if attached {PLANET} obj as planet then
					from grid[obj.row, obj.col].contents.start
					until
						grid[obj.row, obj.col].contents.off
					loop
						if attached grid[obj.row, obj.col].contents.item as quadrant then
							if quadrant.id ~ obj.id then
								moved_entities.force([obj, obj.coord, grid[obj.row,obj.col].contents.index, grid[obj.row,obj.col].contents.index], moved_entities.count + 1)
							end
						end
						grid[obj.row, obj.col].contents.forth
					end
				end

				Result := false
			else
				from grid[obj.row, obj.col].contents.start
				until
					grid[obj.row, obj.col].contents.off
				loop
					if attached grid[obj.row, obj.col].contents.item as quadrant then
						if quadrant.id ~ obj.id then
							grid[obj.row, obj.col].contents.put (void)
							moved_entities.force([obj, obj.coord, grid[obj.row,obj.col].contents.index, grid[obj.row,obj.col].contents.index], moved_entities.count + 1)
							grid[obj.row, obj.col].contents.finish
						end
					end
					grid[obj.row, obj.col].contents.forth
				end

				obj.overwrite_coordinates (coord.row, coord.col)

				from index := 1
				until index > shared_info.max_capacity
				loop
					if not grid[coord.row, coord.col].contents.valid_index (index) then
						grid[coord.row, coord.col].contents.go_i_th (index)
						grid[coord.row, coord.col].contents.force (obj)
						obj.overwrite_quadrant (index)
						moved_entities.at (moved_entities.count).new_quad := index
						index := shared_info.max_capacity
					else
						if not attached grid[coord.row, coord.col].contents[index] then
							grid[coord.row, coord.col].contents[index] := obj
							obj.overwrite_quadrant (index)
							moved_entities.at (moved_entities.count).new_quad := index
							index := shared_info.max_capacity
						end
					end
					index := index + 1
				end

				Result := true
			end
		end

	-- Uses a wormhole
	wormhole : INTEGER
		local
			temp_row, temp_col : INTEGER
			added : BOOLEAN
		do
			Result := 0
			if not ship.is_landed then
				if grid[ship.row, ship.col].has_wormhole then
					from added := false
					until added
					loop
						temp_row := gen.rchoose (1, 5)
						temp_col := gen.rchoose (1, 5)

						if temp_row ~ ship.row and temp_col ~ ship.col then
							added := true
						else
							added := move (ship, [temp_row, temp_col])
						end

						Result := 0
					end
				else Result := 3 end
			else Result := 2 end
		end

	-- Returns an integer given the result of the events
	update : INTEGER
		local
			sorted_planets : ARRAYED_LIST[ENTITY]
			num : INTEGER
			new_planet_coord : COORDINATE
			direction_utility : DIRECTION_UTILITY
			can_move : BOOLEAN
		do
			Result := 0
			across grid[ship.row, ship.col].contents as i
			loop
				if attached {STAR} i.item as star then
					ship.refuel (star.luminosity)
				end
			end

			if ship.fuel = 0 then
				ship.perish (1)
				delete_entity(ship)
				Result := 1
			elseif grid[ship.row, ship.col].has_blackhole then
				ship.perish (2)
				delete_entity(ship)
				Result := 2
			end

			sorted_planets := get_sorted(planets)

			from
				sorted_planets.start
			until
				sorted_planets.off
			loop
				if attached {PLANET} sorted_planets.item as planet then
					if planet.timer = 0 then
						if grid[planet.row, planet.col].has_star then
							planet.attach_to_star
							planet.decrement_turn

							if grid[planet.row, planet.col].has_yellow_dwarf then
								num := gen.rchoose (1, 2)

								if num = 2 then
									planet.support_life
								end
							end
						else
							new_planet_coord := direction_utility.num_dir (gen.rchoose (1, 8))
							new_planet_coord := direction_utility.convert_bounds (planet.row + new_planet_coord.row, planet.col + new_planet_coord.col)

							-- movement
							can_move := move (planet, new_planet_coord)

							-- check
							if grid[planet.row, planet.col].has_blackhole then
								delete_entity(planet)
								sorted_planets.remove
								sorted_planets.back
							else
								-- behave
								if grid[planet.row, planet.col].has_star then
									planet.attach_to_star
									planet.decrement_turn

									if grid[planet.row, planet.col].has_yellow_dwarf then
										num := gen.rchoose (1, 2)

										if num = 2 then
											planet.support_life
										end
									end
								else
									planet.override_turns (gen.rchoose (0, 2))
								end
							end

						end
					else
						planet.decrement_turn
					end
				end

				sorted_planets.forth
			end

			planets := sorted_planets.to_array
		end

	delete_entity (entity : ENTITY)
		do
			across 1 |..| shared_info.max_capacity as j loop
				if grid[entity.row, entity.col].contents.valid_index (j.item) then
					if attached grid[entity.row, entity.col].contents[j.item] as quadrant then
						if quadrant.id ~ entity.id then
							dead_entities.force (entity, dead_entities.count + 1)
							grid[entity.row, entity.col].contents[j.item] := void
						end
					end
				end
			end
		end

feature -- query

	-- returns all entities in the galaxy
	entities : ARRAY[ENTITY]
		local
			row, col : INTEGER
		do
			create Result.make_empty

			from
				row := 1
			until
				row > shared_info.number_rows
			loop
				from
					col := 1
				until
					col > shared_info.number_columns
				loop
					across grid[row, col].contents as i loop
						if attached i.item as item then
							Result.force (item, Result.count + 1)
						end
					end

					col := col + 1
				end

				row := row + 1
			end
		end

	-- returns a sorted version of the array
	get_sorted (array : ARRAY[ENTITY]) : ARRAYED_LIST[ENTITY]
		local
			i, j : INTEGER
		do
			create Result.make_from_array(array)

			from i := 0
			until i > array.count
			loop
				from j := 1
				until j > array.count - 1
				loop
					if i /~ j then
						if Result[j].id > Result[j + 1].id then
							Result.go_i_th(j)
							Result.swap(j + 1)
						end
					end
					j := j + 1
				end
				i := i + 1
			end
		end

	get_movement_sorted (array : ARRAY[TUPLE[ent : ENTITY; old_loc : COORDINATE; old_quad : INTEGER; new_quad : INTEGER]]) :
		ARRAYED_LIST[TUPLE[ent : ENTITY; old_loc : COORDINATE; old_quad : INTEGER; new_quad : INTEGER]]
		local
			i, j : INTEGER
		do
			create Result.make_from_array(array)

			from i := 0
			until i > array.count
			loop
				from j := 1
				until j > array.count - 1
				loop
					if i /~ j then
						if Result[j].ent.id > Result[j + 1].ent.id then
							Result.go_i_th(j)
							Result.swap(j + 1)
						end
					end
					j := j + 1
				end
				i := i + 1
			end
		end

	is_valid_landing : TUPLE[error_code : INTEGER; planet : detachable PLANET]
		do
			Result := [-1, void]
			if ship.is_landed then
				Result := [2, void]
			elseif not grid[ship.row, ship.col].has_yellow_dwarf then
				Result := [3, void]
			elseif not grid[ship.row, ship.col].has_planet then
				Result := [4, void]
			else
				across grid[ship.row, ship.col].contents as i loop
					if attached {PLANET} i.item as planet then
						if not planet.is_landed and not planet.movable then
							if attached Result.planet as t_planet then
								if planet.id < t_planet.id then
									Result.planet := planet
								end
							else
								Result := [-1, planet]
							end
						end
					end
				end

				-- No unvisited planets
				if Result.planet = void then Result := [5, void] end
			end
		end

	print_description (is_test : BOOLEAN) : STRING
		local
			sorted_moved_ents : ARRAYED_LIST[TUPLE[ent : ENTITY; old_loc : COORDINATE; old_quad : INTEGER; new_quad : INTEGER]]
			sorted_ents : ARRAYED_LIST[ENTITY]
			row, col : INTEGER
		do
			create Result.make_empty

			-- Print movement
			Result.append ("%N  Movement:")

			if moved_entities.count ~ 0 then
				result.append("none")
			else
				sorted_moved_ents := get_movement_sorted(moved_entities)

				across sorted_moved_ents as i
				loop
					Result.append ("%N    [")
					Result.append (i.item.ent.id.out)
					Result.append (",")
					Result.append (i.item.ent.entity_type.item.out)
					Result.append ("]:[")
					Result.append (i.item.old_loc.row.out)
					Result.append (",")
					Result.append (i.item.old_loc.col.out)
					Result.append (",")
					Result.append (i.item.old_quad.out)
					Result.append ("]")

					if i.item.ent.row /~ i.item.old_loc.row or
					   i.item.ent.col /~ i.item.old_loc.col then
					   	Result.append ("->[")
						Result.append (i.item.ent.row.out)
						Result.append (",")
						Result.append (i.item.ent.col.out)
						Result.append (",")
						Result.append (i.item.new_quad.out)
						Result.append("]")
					end

				end
			end

			if is_test then
				-- Print Sectors
				Result.append ("%N  Sectors:")

				from
					row := 1
				until
					row > shared_info.number_rows
				loop
					from
						col := 1
					until
						col > shared_info.number_columns
					loop
						Result.append("%N    [")
						Result.append(row.out)
						Result.append(",")
						Result.append(col.out)
						Result.append("]->")
						Result.append(grid[row,col].print_contents)
						col := col + 1
					end
					row := row + 1
				end

				-- Print Descriptions (All Entities)

				Result.append ("%N  Descriptions:")
				sorted_ents := get_sorted(entities)

				across sorted_ents as i
				loop
					if attached {SHIP} i.item as sh then
						if sh.death_code ~ 0 then
							Result.append ("%N    [")
							Result.append (i.item.full_out)
							Result.append ("]->")
							Result.append (sh.print_description)
						end
					else
						Result.append ("%N    [")
						Result.append (i.item.full_out)
						Result.append ("]->")
						if attached {STAR} i.item as st then
							Result.append ("Luminosity:")
							Result.append (st.luminosity.out)
						elseif attached {PLANET} i.item as pl then
							Result.append (pl.print_description)
						end
					end
				end

				Result.append ("%N  Deaths This Turn:")

				-- Print perished entities

				if dead_entities.count ~ 0 then
					Result.append ("none")
				else
					across dead_entities as i loop
						Result.append("%N    ")
						if attached {PLANET} i.item as pl then
							Result.append ("[")
							Result.append (pl.full_out)
							Result.append ("]->")
							Result.append (pl.print_description)
							Result.append (",%N      Planet got devoured by blackhole (id: -1) at Sector:3:3")
						elseif attached {SHIP} i.item as sh then
							Result.append ("[")
							Result.append (sh.full_out)
							Result.append ("]->")
							Result.append (sh.print_description)
							Result.append (",")
							Result.append ("%N      ")
							Result.append (sh.print_death_status)
						end
					end
				end
			end

			create dead_entities.make_empty
			create moved_entities.make_empty
		end

	out: STRING
	--Returns grid in string form
	local
		string1, string2: STRING
		row_counter, column_counter: INTEGER
		contents_counter, printed_symbols_counter: INTEGER
		temp_sector: SECTOR
		temp_component: ENTITY
	do
		create Result.make_empty
		create string1.make(7*shared_info.number_rows)
		create string2.make(7*shared_info.number_columns)
		string1.append("%N")

		from
			row_counter := 1
		until
			row_counter > shared_info.number_rows
		loop
			string1.append("    ")
			string2.append("    ")

			from
				column_counter := 1
			until
				column_counter > shared_info.number_columns
			loop
				temp_sector:= grid[row_counter, column_counter]
			    string1.append("(")
            	string1.append(temp_sector.print_sector)
                string1.append(")")
			    string1.append("  ")
				from
					contents_counter := 1
					printed_symbols_counter:=0
				until
					contents_counter > temp_sector.contents.count
				loop
					temp_component := temp_sector.contents[contents_counter]
					if attached temp_component then
						if attached temp_component.entity_type as character then
							string2.append_character(character.item)
						end
					else
						string2.append("-")
					end -- if
					printed_symbols_counter:=printed_symbols_counter+1
					contents_counter := contents_counter + 1
				end -- loop

				from
				until (shared_info.max_capacity - printed_symbols_counter)=0
				loop
						string2.append("-")
						printed_symbols_counter:=printed_symbols_counter+1

				end
				string2.append("   ")
				column_counter := column_counter + 1
			end -- loop
			string1.append("%N")
			if not (row_counter = shared_info.number_rows) then
				string2.append("%N")
			end
			Result.append (string1.twin)
			Result.append (string2.twin)

			row_counter := row_counter + 1
			string1.wipe_out
			string2.wipe_out
		end
	end
end
