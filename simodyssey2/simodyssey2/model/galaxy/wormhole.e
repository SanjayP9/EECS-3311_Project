note
	description: "Summary description for {WORMHOLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	WORMHOLE

inherit
	ENTITY

create
	make

feature
	make (a_row, a_col, a_id : INTEGER)
		require
			valid_stationary_id : (a_id <= -2)
		do
			id := a_id
			row := a_row
			col := a_col
			create entity_type.make('W')
			movable := false
		ensure
			coords_set_check : row ~ a_row and col ~ a_col and id ~ a_id
		end
end

