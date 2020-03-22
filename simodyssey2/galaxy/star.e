note
	description: "Summary description for {STAR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	STAR

inherit
	ENTITY

create
	make_yellow_dwarf,
	make_blue_giant

feature -- attributes
	luminosity : INTEGER

feature
	make_yellow_dwarf (a_row, a_col, a_id : INTEGER)
		require
			valid_stationary_id : (a_id <= -2)
		do
			id := a_id
			row := a_row
			col := a_col
			create entity_type.make('Y')
			luminosity := 2
		end

	make_blue_giant (a_row, a_col, a_id : INTEGER)
		require
			valid_stationary_id : (a_id <= -2)
		do
			id := a_id
			row := a_row
			col := a_col
			create entity_type.make('*')
			luminosity := 5
		end


end
