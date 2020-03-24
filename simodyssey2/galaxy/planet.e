note
	description: "Summary description for {PLANET}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PLANET

inherit
	MOVABLE_ENTITY
		export {NONE}
			fuel, max_fuel,
			life, max_life
		end

create
	make

feature -- attribute
	is_landed : BOOLEAN
	has_life : BOOLEAN

feature
	make (a_row, a_col, a_id, a_quadrant : INTEGER)
		require
			valid_planet_id: a_id >= 1
		do
			row := a_row
			col := a_col
			quadrant := a_quadrant
			create entity_type.make('P')
			id := a_id
			movable := true
		end

feature -- commands
	attach_to_star
		do
			movable := false
		end

	support_life
		do
			has_life := true
		end

	land
		do
			is_landed := true
		end

feature {GALAXY} -- queries
	print_death_status : STRING
		do
			Result := "not implemented"
		end

	print_description : STRING
		do
			Result := ""
			Result.append ("attached?:")

			if movable then
				Result.append ("F")
			else
				Result.append ("T")
			end

			Result.append (", support_life?:")

			if has_life then
				Result.append ("T")
			else
				Result.append ("F")
			end

			Result.append (", visited?:")

			if is_landed then
				Result.append ("T")
			else
				Result.append ("F")
			end

			Result.append (", turns_left:")

			if (row ~ 3 and col ~ 3) or not movable then
				Result.append ("N/A")
			else
				Result.append (turns_left.out)
			end
		end
end
