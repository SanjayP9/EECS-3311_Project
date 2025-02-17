note
	description: "Summary description for {BLACKHOLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BLACKHOLE

inherit
	ENTITY

create
	make

feature
	make (a_row, a_col : INTEGER)
		do
			row := a_row
			col := a_col
			create entity_type.make('O')
			id := -1
			movable := false
		ensure
			coords_set_check : row ~ a_row and col ~ a_col
		end

invariant
	not_movable : movable ~ false
end
