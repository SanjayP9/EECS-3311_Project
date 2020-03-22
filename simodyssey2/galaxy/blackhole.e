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
		end

end
