note
	description: "Summary description for {BENIGN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BENIGN

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
			create entity_type.make ('B')
			id := a_id
			movable := true
		end

feature -- queries
	print_death_status : STRING
		do
			Result := ""
			inspect death_code
			when 1 then
				Result := "Benign got lost in space - out of fuel at Sector:"
			when 2 then
				Result := "Benign got devoured by blackhole (id: -1) at Sector:"
			when 3 then
				if attached {ENTITY} killer as e then
					Result := "Benign got destroyed by asteroid (id: "
					Result.append (e.id.out)
					Result.append (") at Sector:")
				end
			end

			Result.append (row.out)
			Result.append (":")
			Result.append (col.out)
		end

	print_description : STRING
		do
			Result := "fuel:"
			Result.append(fuel.out)
			Result.append ("/")
			Result.append (max_fuel.out)
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
