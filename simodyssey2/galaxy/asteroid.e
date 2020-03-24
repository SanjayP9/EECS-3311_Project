note
	description: "Summary description for {ASTEROID}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ASTEROID

inherit
	MOVABLE_ENTITY
		export {NONE}
			fuel, max_fuel,
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
			create entity_type.make ('A')
			id := a_id
			movable := true
		end

feature -- queries
	print_death_status : STRING
		do
			Result := ""
			inspect death_code
			when 2 then
				Result := "Asteroid got devoured by blackhole (id: -1) at Sector:"
			when 3 then
				if attached {ENTITY} killer as e then
					Result := "Asteroid got imploded by janitaur (id: "
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
			Result := "turns_left:"
			if death_code /~ 0 then
				Result.append ("N/A")
			else
				Result.append (turns_left.out)
			end
		end

end
