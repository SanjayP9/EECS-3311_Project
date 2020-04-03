note
	description: "Summary description for {MALEVOLENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MALEVOLENT

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
			create entity_type.make ('M')
			id := a_id
			movable := true
			fuel := 3
			max_fuel := 3
			reproduction_turns := 1
		ensure
			coords_set_check : row ~ a_row and col ~ a_col and id ~ a_id and quadrant ~ a_quadrant
		end

feature -- commands

feature -- queries
	print_death_status : STRING
		do
			Result := ""
			inspect death_code
			when 1 then
				Result := "Malevolent got lost in space - out of fuel at Sector:"
			when 2 then
				Result := "Malevolent got devoured by blackhole (id: -1) at Sector:"
			when 3 then
				if attached {ENTITY} killer as e then
					Result := "Malevolent got destroyed by asteroid (id: "
					Result.append (e.id.out)
					Result.append (") at Sector:")
				end
			when 4 then
				if attached {ENTITY} killer as e then
					Result := "Malevolent got destroyed by benign (id: "
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
			-- fuel:3/3, actions_left_until_reproduction:1/1, turns_left:1

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
