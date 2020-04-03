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
	reproduced_entities : ARRAY[TUPLE[parent : ENTITY; child : ENTITY]]
	dead_entities : ARRAY[ENTITY]
	attacked : ARRAY[ENTITY]

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

feature {NONE}
	planets : ARRAY[ENTITY]
	benigns : ARRAY[ENTITY]
	janitaurs : ARRAY[ENTITY]
	asteroids : ARRAY[ENTITY]
	malevolents : ARRAY[ENTITY]
	movable_id : INTEGER

feature --constructor

	make
		-- creates a dummy of galaxy grid
		local
			row, column : INTEGER
		do
			-- used for test mode
			create moved_entities.make_empty
			create dead_entities.make_empty
			create reproduced_entities.make_empty
			create attacked.make_empty

			-- entity lists			
			create planets.make_empty
			create benigns.make_empty
			create janitaurs.make_empty
			create asteroids.make_empty
			create malevolents.make_empty

			-- ship
			create ship.make(1, 1, 1)

			-- create sectors
			create grid.make_filled (create {SECTOR}.make_dummy, shared_info.number_rows, shared_info.number_columns)
			movable_id := 1
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
					grid[row,column] := create {SECTOR}.make(row,column, ship, movable_id)

					-- Check how many planets were added
					across grid[row, column].contents as i
					loop
						if attached i.item as quadrant then
							if quadrant.entity_type.item ~ 'P' then
								planets.force (quadrant, planets.count + 1)
								movable_id := movable_id + 1
							elseif quadrant.entity_type.item ~ 'B' then
								benigns.force (quadrant, benigns.count + 1)
								movable_id := movable_id + 1
							elseif quadrant.entity_type.item ~ 'M' then
								malevolents.force (quadrant, malevolents.count + 1)
								movable_id := movable_id + 1
							elseif quadrant.entity_type.item ~ 'J' then
								janitaurs.force (quadrant, janitaurs.count + 1)
								movable_id := movable_id + 1
							elseif quadrant.entity_type.item ~ 'A' then
								asteroids.force (quadrant, asteroids.count + 1)
								movable_id := movable_id + 1
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
		ensure
			verify_stationary_entity: Result.entity_type.item ~ 'Y' or Result.entity_type.item ~ '*' or Result.entity_type.item ~ 'W'
			verify_correct_row_col: Result.coord.row ~ a_row and Result.coord.col ~ a_col
		end

	move (obj : ENTITY; coord : COORDINATE) : BOOLEAN
		local
			index : INTEGER
		do
			if grid[coord.row, coord.col].is_full then

				if not attached {SHIP} obj then
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
		ensure
			has_moved: Result ~ true implies not old grid[coord.row,coord.col].is_full and (obj.row ~ coord.row and obj.col ~ coord.col)
			has_not_moved: Result ~ false implies old grid[coord.row,coord.col].is_full and (old obj.row ~ obj.row and old obj.col ~ obj.col and old obj.quadrant ~ obj.quadrant)
		end

	-- Uses a wormhole
	wormhole (entity : ENTITY) : INTEGER
		local
			temp_row, temp_col : INTEGER
			added : BOOLEAN
		do
			Result := 0
			if attached {SHIP} entity as ent then
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
			else
				from added := false
				until added
				loop
					temp_row := gen.rchoose (1, 5)
					temp_col := gen.rchoose (1, 5)

					if not grid[temp_row, temp_col].is_full then
						added := move (entity, [temp_row, temp_col])
					end
				end
			end
		end

	-- Returns an integer given the result of the events
	update : INTEGER
		local
			sorted_entities : ARRAYED_LIST[ENTITY]
			num : INTEGER
			new_coord : COORDINATE
			direction_utility : DIRECTION_UTILITY
			can_move : BOOLEAN
			wormhole_int : INTEGER
			behave_error_code : INTEGER
		do
			Result := 0
			across grid[ship.row, ship.col].contents as i
			loop
				if attached {STAR} i.item as star then
					ship.refuel (star.luminosity)
				end
			end

			if ship.fuel = 0 then
				ship.perish (1, void)
				delete_entity(ship)
				Result := 1
			elseif grid[ship.row, ship.col].has_blackhole then
				ship.perish (2, void)
				delete_entity(ship)
				Result := 2
			end

			sorted_entities := get_sorted(entities)

			from
				sorted_entities.start
			until
				sorted_entities.off
			loop
				if attached {MOVABLE_ENTITY} sorted_entities.item as mov_ent then
					if mov_ent.death_code /~ 0 then
						sorted_entities.remove
						sorted_entities.back
					elseif mov_ent.id /~ 0 and mov_ent.turns_left ~ 0 then
						if attached {PLANET} mov_ent as planet and
							grid[mov_ent.row, mov_ent.col].has_star then
							planet.attach_to_star
							planet.decrement_turn

							if grid[planet.row, planet.col].has_yellow_dwarf then
								num := gen.rchoose (1, 2)

								if num = 2 then
									planet.support_life
								end
							end
						else
							-- move
							if grid[mov_ent.row, mov_ent.col].has_wormhole and
							   (attached {MALEVOLENT} mov_ent or attached {BENIGN} mov_ent) then
								wormhole_int := wormhole(mov_ent)
							else
								new_coord := direction_utility.num_dir (gen.rchoose (1, 8))
								new_coord := direction_utility.convert_bounds (mov_ent.row + new_coord.row, mov_ent.col + new_coord.col)

								can_move := move (mov_ent, new_coord)

								if can_move then
									mov_ent.use_fuel
								end
							end

							-- refueling
							if attached {MALEVOLENT} mov_ent or attached {BENIGN} mov_ent or
							   attached {JANITAUR} mov_ent and grid[mov_ent.row, mov_ent.col].has_star then
								across grid[mov_ent.row, mov_ent.col].contents as i loop
									if attached {STAR} i.item as star then
										mov_ent.refuel (star.luminosity)
									end
								end
							end

							if not attached {PLANET} mov_ent and
							   not attached {ASTEROID} mov_ent and mov_ent.fuel ~ 0 then
								mov_ent.perish (1, void)
								delete_entity (mov_ent)
							elseif grid[mov_ent.row, mov_ent.col].has_blackhole then -- check
								mov_ent.perish (2, void)
								delete_entity(mov_ent)
								sorted_entities.remove
								sorted_entities.back
							else
								reproduce (mov_ent)
								-- behave
								behave_error_code := behave (mov_ent)

								if behave_error_code /~ 0 then
									Result := behave_error_code
								end

							end
						end
					else
						mov_ent.decrement_turn
					end
				end

				sorted_entities.forth
			end
		end

	reproduce (mov_ent : MOVABLE_ENTITY)
		local
			index : INTEGER
		do
			-- reproduce
			if attached {MALEVOLENT} mov_ent or attached {BENIGN} mov_ent or attached {JANITAUR} mov_ent then
				if not grid[mov_ent.row, mov_ent.col].is_full and mov_ent.reproduction_turns ~ 0 then
					from
						index := 1
					until index > shared_info.max_capacity
					loop
						if not grid[mov_ent.row, mov_ent.col].contents.valid_index (index) then
							grid[mov_ent.row, mov_ent.col].contents.go_i_th (index)
							if attached {MALEVOLENT} mov_ent as malevolent then
								grid[mov_ent.row, mov_ent.col].contents.force (create {MALEVOLENT}.make (mov_ent.row, mov_ent.col, movable_id, index))
								malevolent.override_reproduction (1)
							elseif attached {JANITAUR} mov_ent as janitaur then
								grid[mov_ent.row, mov_ent.col].contents.force (create {JANITAUR}.make (mov_ent.row, mov_ent.col, movable_id, index))
								janitaur.override_reproduction (2)
							elseif attached {BENIGN} mov_ent as benign then
								grid[mov_ent.row, mov_ent.col].contents.force (create {BENIGN}.make (mov_ent.row, mov_ent.col, movable_id, index))
								benign.override_reproduction (1)
							end

							if attached grid[mov_ent.row, mov_ent.col].contents[index] as child then
								reproduced_entities.force ([mov_ent, child], reproduced_entities.count + 1)
							end

							movable_id := movable_id + 1

							if attached {MOVABLE_ENTITY} grid[mov_ent.row, mov_ent.col].contents[index] as ent then
								ent.override_turns (gen.rchoose (0, 2))
							end

							index := shared_info.max_capacity
						elseif not attached grid[mov_ent.row, mov_ent.col].contents[index] then
							grid[mov_ent.row, mov_ent.col].contents.go_i_th (index)
							if attached {MALEVOLENT} mov_ent as malevolent then
								grid[mov_ent.row, mov_ent.col].contents.replace (create {MALEVOLENT}.make (mov_ent.row, mov_ent.col, movable_id, index))
								malevolent.override_reproduction (1)
							elseif attached {JANITAUR} mov_ent as janitaur then
								grid[mov_ent.row, mov_ent.col].contents.replace (create {JANITAUR}.make (mov_ent.row, mov_ent.col, movable_id, index))
								janitaur.override_reproduction (2)
							elseif attached {BENIGN} mov_ent as benign then
								grid[mov_ent.row, mov_ent.col].contents.replace (create {BENIGN}.make (mov_ent.row, mov_ent.col, movable_id, index))
								benign.override_reproduction (1)
							end

							if attached grid[mov_ent.row, mov_ent.col].contents[index] as child then
								reproduced_entities.force ([mov_ent, child], reproduced_entities.count + 1)
							end

							movable_id := movable_id + 1

							if attached {MOVABLE_ENTITY} grid[mov_ent.row, mov_ent.col].contents[index] as ent then
								ent.override_turns (gen.rchoose (0, 2))
							end

							index := shared_info.max_capacity
						end
						index := index + 1
					end
				elseif mov_ent.reproduction_turns /~ 0 then
					mov_ent.decrement_reproduction
				end
			end
		ensure
		end

	behave (mov_ent : MOVABLE_ENTITY) : INTEGER
		local
			sorted : ARRAYED_LIST[ENTITY]
			num : INTEGER
		do
			if attached {ASTEROID} mov_ent as asteroid then
				across grid[asteroid.row, asteroid.col].contents as ent loop
					if not attached {PLANET} ent.item and not attached {ASTEROID} ent.item and
						 attached {MOVABLE_ENTITY} ent.item as perished_ent then
					   	if attached {SHIP} ent.item then
							ship.perish (3, asteroid)
							delete_entity(ship)
							Result := 3
						elseif perished_ent.id /~ asteroid.id then
							perished_ent.perish (3, asteroid)
							delete_entity(perished_ent)
						end
					end
				end
				asteroid.override_turns (gen.rchoose (0, 2))

			elseif attached {JANITAUR} mov_ent as janitaur then
				create sorted.make (0)
				sorted := get_sorted(grid[mov_ent.row, mov_ent.col].get_attached_contents)

				from sorted.start
				until sorted.off
				loop
					across grid[mov_ent.row, mov_ent.col].contents as ent loop
						if attached {ASTEROID} ent.item as e then
							if sorted.item.id ~ e.id and not janitaur.at_max_capacity then
								e.perish (3, janitaur)
								delete_entity(e)
								janitaur.add_load
							end
						end
					end

					sorted.forth
				end

				if grid[mov_ent.row, mov_ent.col].has_wormhole then
					janitaur.clear_load
				end

				janitaur.override_turns (gen.rchoose (0, 2))
			elseif attached {BENIGN} mov_ent as benign then
				create sorted.make (0)
				sorted := get_sorted(grid[benign.row, benign.col].get_attached_contents)

				from sorted.start
				until sorted.off
				loop
					across grid[mov_ent.row, mov_ent.col].contents as ent loop
						if attached {MALEVOLENT} ent.item as e then
							if sorted.item.id ~ e.id then
								e.perish (4, benign)
								delete_entity (e)
							end
						end
					end

					sorted.forth
				end
				mov_ent.override_turns (gen.rchoose (0, 2))
			elseif attached {MALEVOLENT} mov_ent as malevolent then
				if grid[malevolent.row, malevolent.col].has_ship and not grid[malevolent.row, malevolent.col].has_benign and
				   not ship.is_landed then
					ship.decrement_life

					attacked.force (malevolent, attacked.count + 1)

					if ship.life ~ 0 then
						ship.perish (4, malevolent)
						delete_entity(ship)
						Result := 4
					end

				end
				malevolent.override_turns (gen.rchoose (0, 2))
			elseif attached {PLANET} mov_ent as planet then
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
		ensure
			array_size_check: array.count ~ Result.count
			array_content_check: across array as k all Result.has(k.item) end
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
		ensure
			array_size_check: array.count ~ Result.count
			array_content_check: across array as k all Result.has(k.item) end
		end

	get_reproduced_sorted (array : ARRAY[TUPLE[parent : ENTITY; child : ENTITY]]) :
		ARRAYED_LIST[TUPLE[parent : ENTITY; child : ENTITY]]
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
						if Result[j].child.id > Result[j + 1].child.id then
							Result.go_i_th(j)
							Result.swap(j + 1)
						end
					end
					j := j + 1
				end
				i := i + 1
			end
		ensure
			array_size_check: array.count ~ Result.count
			array_content_check: across array as k all Result.has(k.item) end
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
		ensure
			valid_error_code: Result.error_code ~ -1 or Result.error_code ~ 2 or Result.error_code ~ 3 or Result.error_code ~ 4 or Result.error_code ~ 5
		end

	print_description (is_test : BOOLEAN) : STRING
		local
			sorted_moved_ents : ARRAYED_LIST[TUPLE[ent : ENTITY; old_loc : COORDINATE; old_quad : INTEGER; new_quad : INTEGER]]
			sorted_ents : ARRAYED_LIST[ENTITY]
			temp_dead : ARRAY[ENTITY]
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
					   i.item.ent.col /~ i.item.old_loc.col or
					   i.item.ent.quadrant /~ i.item.old_quad then
					   	Result.append ("->[")
						Result.append (i.item.ent.row.out)
						Result.append (",")
						Result.append (i.item.ent.col.out)
						Result.append (",")
						Result.append (i.item.new_quad.out)
						Result.append("]")
					end

					reproduced_entities := get_reproduced_sorted (reproduced_entities).to_array
					across reproduced_entities as j loop
						if j.item.parent.id ~ i.item.ent.id then
							Result.append ("%N      reproduced [")
							Result.append (j.item.child.full_out)
							Result.append ("] at [")
							Result.append (j.item.child.row.out)
							Result.append (",")
							Result.append (j.item.child.col.out)
							Result.append (",")
							Result.append (j.item.child.quadrant.out)
							Result.append ("]")
						end
					end

					temp_dead := dead_entities.deep_twin
					across get_sorted (dead_entities).to_array as j loop
						if attached {MOVABLE_ENTITY} j.item as ent then
							if attached {ENTITY} ent.killer as killer then
								if killer.id ~ i.item.ent.id and (ent.id /~ 0 or killer.entity_type.item ~ 'A')  then
									Result.append ("%N      destroyed [")
									Result.append (ent.full_out)
									Result.append ("] at [")
									Result.append (ent.row.out)
									Result.append (",")
									Result.append (ent.col.out)
									Result.append (",")
									Result.append (ent.quadrant.out)
									Result.append ("]")
								end
							end
						end
					end
					dead_entities := temp_dead

					if attached {MALEVOLENT} i.item.ent as malevolent then
						across attacked as j loop
							if j.item.id ~ i.item.ent.id then
								--attacked [0,E] at [1,1,1]
								Result.append ("%N      attacked [0,E] at [")
								Result.append (ship.row.out)
								Result.append (",")
								Result.append (ship.col.out)
								Result.append (",")
								Result.append (ship.quadrant.out)
								Result.append ("]")
							end
						end
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
						elseif attached {MOVABLE_ENTITY} i.item as mov_ent then
							Result.append (mov_ent.print_description)
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
						elseif attached {MALEVOLENT} i.item as ml then
							Result.append ("[")
							Result.append (ml.full_out)
							Result.append ("]->")
							Result.append (ml.print_description)
							Result.append (",")
							Result.append ("%N      ")
							Result.append (ml.print_death_status)
						elseif attached {ASTEROID} i.item as ast then
							Result.append ("[")
							Result.append (ast.full_out)
							Result.append ("]->")
							Result.append (ast.print_description)
							Result.append (",")
							Result.append ("%N      ")
							Result.append (ast.print_death_status)
						elseif attached {JANITAUR} i.item as jn then
							Result.append ("[")
							Result.append (jn.full_out)
							Result.append ("]->")
							Result.append (jn.print_description)
							Result.append (",")
							Result.append ("%N      ")
							Result.append (jn.print_death_status)
						elseif attached {BENIGN} i.item as bn then
							Result.append ("[")
							Result.append (bn.full_out)
							Result.append ("]->")
							Result.append (bn.print_description)
							Result.append (",")
							Result.append ("%N      ")
							Result.append (bn.print_death_status)
						end
					end
				end
			end

			create dead_entities.make_empty
			create moved_entities.make_empty
			create reproduced_entities.make_empty
			create attacked.make_empty
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
