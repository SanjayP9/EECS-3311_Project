note
	description: "Summary description for {JANITAUR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	JANITAUR

inherit
	MOVABLE_ENTITY
		export {NONE}
			life, max_life
		end

create
	make

feature
	make (a_row, a_col, a_id, a_quadrant : INTEGER)
		do
			row := a_row
			col := a_col
			quadrant := a_quadrant
			create entity_type.make ('J')
			id := a_id
			movable := true
			fuel := 5
			max_fuel := 5
			load := 0
			max_load := 2
		end

feature -- attributes
	load, max_load : INTEGER

feature -- commands
	add_load
		do
			load := load + 1
		end

	clear_load
		do
			load := 0
		end

	at_max_capacity : BOOLEAN
		do
			Result := load ~ max_load
		end

feature -- queries
	print_death_status : STRING
		do
			Result := ""
			inspect death_code
			when 1 then
				Result := "Janitaur got lost in space - out of fuel at Sector:"
			when 2 then
				Result := "Janitaur got devoured by blackhole (id: -1) at Sector:"
			when 3 then
				if attached {ENTITY} killer as ent then
					Result := "Janitaur got destroyed by asteroid (id: "
					Result.append (ent.id.out)
					Result.append (") at Sector:")
				end
			end


			Result.append (row.out)
			Result.append (":")
			Result.append (col.out)
		end

	print_description : STRING
		do
			-- fuel:5/5, load:0/2, actions_left_until_reproduction:2/2, turns_left:0

			Result := "fuel:"
			Result.append(fuel.out)
			Result.append ("/")
			Result.append (max_fuel.out)
			Result.append (", load:")
			Result.append (load.out)
			Result.append ("/")
			Result.append (max_load.out)
			Result.append (", actions_left_until_reproduction:")
			Result.append (reproduction_turns.out)
			Result.append ("/1, turns_left:")

			if (row ~ 3 and col ~ 3) or not movable then
				Result.append ("N/A")
			else
				Result.append (turns_left.out)
			end
		end

end
