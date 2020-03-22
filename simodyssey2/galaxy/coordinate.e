note
	description: "Summary description for {COORDINATE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COORDINATE

create
	make

convert
	make({TUPLE[INTEGER, INTEGER]})

feature {NONE}
	make(coord : TUPLE[row: INTEGER; col :INTEGER])
		do
			row := coord.row
			col := coord.col
		end

feature --attributes
	row, col : INTEGER

end
