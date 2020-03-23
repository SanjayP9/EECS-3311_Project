note
	description: "Summary description for {JANITAUR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	JANITAUR

inherit
	MOVABLE_ENTITY

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
		end
		
feature -- queries
	print_description : STRING
		do
			Result := "not implemented"
		end

end
