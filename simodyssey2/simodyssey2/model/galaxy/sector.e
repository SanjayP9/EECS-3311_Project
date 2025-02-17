note
	description: "Represents a sector in the galaxy."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SECTOR

create
	make, make_dummy

feature -- attributes
	shared_info_access : SHARED_INFORMATION_ACCESS
	gen: RANDOM_GENERATOR_ACCESS

	contents: ARRAYED_LIST [detachable ENTITY] --holds 4 quadrants

	row: INTEGER

	column: INTEGER

feature -- constructor
	make(row_input: INTEGER; column_input: INTEGER; a_explorer: SHIP; movable_id: INTEGER)
		--initialization
		require
			valid_row: (row_input >= 1) and (row_input <= shared_info_access.shared_info.number_rows)
			valid_column: (column_input >= 1) and (column_input <= shared_info_access.shared_info.number_columns)
		do
			row := row_input
			column := column_input
			create contents.make (shared_info_access.shared_info.max_capacity) -- Each sector should have 4 quadrants
			contents.compare_objects
			if (row = 3) and (column = 3) then
				put (create {BLACKHOLE}.make (3, 3)) -- If this is the sector in the middle of the board, place a black hole
			else
				if (row = 1) and (column = 1) then
					put (a_explorer) -- If this is the top left corner sector, place the explorer there
				end
				populate (movable_id) -- Run the populate command to complete setup
			end -- if
		end

feature -- commands
	make_dummy
		--initialization without creating entities in quadrants
		do
			create contents.make (shared_info_access.shared_info.max_capacity)
			contents.compare_objects
		end

	populate (movable_id : INTEGER)
			-- this feature creates 1 to max_capacity-1 components to be intially stored in the
			-- sector. The component may be a planet or nothing at all.
		local
			threshold: INTEGER
			number_items: INTEGER
			loop_counter: INTEGER
			component: ENTITY
			turn :INTEGER
			m_id : INTEGER
		do
			m_id := movable_id
			number_items := gen.rchoose (1, shared_info_access.shared_info.max_capacity-1)  -- MUST decrease max_capacity by 1 to leave space for Explorer (so a max of 3)
			from
				loop_counter := 1
			until
				loop_counter > number_items
			loop
				threshold := gen.rchoose (1, 100) -- each iteration, generate a new value to compare against the threshold values provided by `test` or `play`


				if threshold < shared_info_access.shared_info.asteroid_threshold then
					component := create {ASTEROID}.make (row, column, m_id, loop_counter)
				elseif threshold < shared_info_access.shared_info.janitaur_threshold then
					component := create {JANITAUR}.make (row, column, m_id, loop_counter)
				elseif (threshold < shared_info_access.shared_info.malevolent_threshold) then
					component := create {MALEVOLENT}.make (row, column, m_id, loop_counter)
				elseif (threshold < shared_info_access.shared_info.benign_threshold) then
					component := create {BENIGN}.make (row, column, m_id, loop_counter)
				elseif threshold < shared_info_access.shared_info.planet_threshold then
					component := create {PLANET}.make(row, column, m_id, loop_counter)
				else
					m_id := m_id - 1
				end

				m_id := m_id + 1

				if attached component as entity then
					put (entity) -- add new entity to the contents list
					component.overwrite_quadrant (contents.count)

					--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
					turn:=gen.rchoose (0, 2) -- Hint: Use this number for assigning turn values to the planet created
					-- The turn value of the planet created (except explorer) suggests the number of turns left before it can move.
					--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
					if attached {MOVABLE_ENTITY} entity as movable_ent then
						movable_ent.override_turns (turn)
					end
					component := void -- reset component object
				end

				loop_counter := loop_counter + 1
			end
		end

feature {GALAXY} --command

	put (new_component: ENTITY)
			-- put `new_component' in contents array
		local
			loop_counter: INTEGER
			found: BOOLEAN
		do
			from
				loop_counter := 1
			until
				loop_counter > contents.count or found
			loop
				if contents [loop_counter] = new_component then
					found := TRUE
				end --if
				loop_counter := loop_counter + 1
			end -- loop

			if not found and not is_full then
				contents.extend (new_component)
			end

		ensure
			component_put: not is_full implies contents.has (new_component)
		end

feature -- Queries
	get_attached_contents : ARRAY[ENTITY]
		do
			create Result.make_empty
			across contents as entity loop
				if attached {ENTITY} entity.item as ent then
					Result.force (ent, Result.count + 1)
				end
			end
		end


	print_sector: STRING
			-- Printable version of location's coordinates with different formatting
		do
			Result := ""
			Result.append (row.out)
			Result.append (":")
			Result.append (column.out)
		end

	print_contents : STRING
		-- Prints sector contents
		do
			Result := ""
			across 1 |..| shared_info_access.shared_info.max_capacity as i
			loop
				if contents.valid_index (i.item) then
					if attached contents[i.item] as ent then
						Result.append ("[")
						Result.append (ent.full_out)
						Result.append ("]")
					else
						Result.append ("-")
					end
				else
					Result.append ("-")
				end

				if i.item /~ shared_info_access.shared_info.max_capacity then
					Result.append (",")
				end
			end
		end

	is_full: BOOLEAN
			-- Is the location currently full?
		local
			loop_counter: INTEGER
			occupant: ENTITY
			empty_space_found: BOOLEAN
		do
			if contents.count < shared_info_access.shared_info.max_capacity then
				empty_space_found := TRUE
			end
			from
				loop_counter := 1
			until
				loop_counter > contents.count or empty_space_found
			loop
				occupant := contents [loop_counter]
				if not attached occupant  then
					empty_space_found := TRUE
				end
				loop_counter := loop_counter + 1
			end

			Result := contents.count = shared_info_access.shared_info.max_capacity and then not empty_space_found
		end

	has_stationary: BOOLEAN
			-- returns whether the location contains any stationary item
		local
			loop_counter: INTEGER
		do
			from
				loop_counter := 1
			until
				loop_counter > contents.count or Result
			loop
				if attached contents [loop_counter] as temp_item  then
					Result := not temp_item.movable
				end -- if
				loop_counter := loop_counter + 1
			end
		end

	has_planet : BOOLEAN
		do
			Result := contents.has (create {PLANET}.make (0, 0, 1, 0))
		end

	has_star : BOOLEAN
		do
			Result := has_yellow_dwarf or has_blue_giant
		end

	has_yellow_dwarf : BOOLEAN
		do
			Result := contents.has (create {STAR}.make_yellow_dwarf (0, 0, -2))
		end

	has_blue_giant : BOOLEAN
		do
			Result := contents.has (create {STAR}.make_blue_giant (0, 0, -2))
		end

	has_explorer : BOOLEAN
		do
			Result := contents.has (create {SHIP}.make (0, 0, 0))
		end

	has_wormhole : BOOLEAN
		do
			Result := contents.has (create {WORMHOLE}.make (0, 0, -2))
		end

	has_blackhole : BOOLEAN
		do
			Result := contents.has (create {BLACKHOLE}.make (0, 0))
		end

	has_ship : BOOLEAN
		do
			Result := contents.has (create {SHIP}.make (0, 0, 0))
		end

	has_benign : BOOLEAN
		do
			Result := contents.has (create {BENIGN}.make (0, 0, 0, 0))
		end

	has_malevolent : BOOLEAN
		do
			Result := contents.has (create {MALEVOLENT}.make (0, 0, 2, 0))
		end

	has_asteroid : BOOLEAN
		do
			Result := contents.has (create {ASTEROID}.make (0, 0, 2, 0))
		end

invariant
	max_contents : contents.count <= shared_info_access.shared_info.max_capacity

end
