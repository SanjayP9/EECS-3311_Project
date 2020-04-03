note
	description: "Summary description for {ENTITY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ENTITY

inherit
	ANY
		redefine
			out,
			is_equal
		end

feature
	id : INTEGER
	entity_type : ENTITY_ALPHABET
	row : INTEGER
	col : INTEGER
	quadrant : INTEGER
	movable : BOOLEAN

feature -- commands
	overwrite_coordinates (a_row, a_col : INTEGER)
		do
			row := a_row
			col := a_col
		ensure
			row = a_row
			col = a_col
		end

	overwrite_quadrant (a_quadrant : INTEGER)
		do
			quadrant := a_quadrant
		ensure
			quadrant = a_quadrant
		end

feature -- queries

	coord : COORDINATE
		do
			Result := [row, col]
		ensure
			Result.row = row and Result.col = col
		end

	is_equal(other : like Current): BOOLEAN
        do
            Result := current.entity_type.item.is_equal (other.entity_type.item)
        end

	out : STRING
		do
			Result := entity_type.out
		end

	full_out : STRING
		do
			create Result.make_empty
			Result.append (id.out)
			Result.append (",")
			Result.append (out)
		end
end
