note
	description: "Summary description for {MALEVOLENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MALEVOLENT

inherit
	MOVABLE_ENTITY

create
	make

feature -- attributes
	reproduction_turns : INTEGER

feature
	make (a_row, a_col, a_id, a_quadrant : INTEGER)
		do
			row := a_row
			col := a_col
			quadrant := a_quadrant
			create entity_type.make ('M')
			id := a_id
			movable := true
		end

feature -- commands
	override_reproduction (turns : INTEGER)
		do
			reproduction_turns := turns
		end

feature -- queries
	print_description : STRING
		do
			Result := "not implemented"
		end

end
