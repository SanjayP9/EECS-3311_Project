note
	description: "Converts a direction into a row, column tuple."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	DIRECTION_UTILITY

feature -- queries
	N: COORDINATE
			-- Tuple modifier for North
			-- move up one row (-1)
		once
			Result := [-1, 0]
		end

	E: COORDINATE
			-- Tuple modifier for East
		once
			Result := [0, 1]
		end

	S: COORDINATE
			-- Tuple modifier for South
		once
			Result := [1, 0]
		end

	W: COORDINATE
			-- Tuple modifier for West
		once
			Result := [0, -1]
		end

	NE: COORDINATE
			-- Tuple modifier for North
			-- move up one row (-1)
		once
			Result := [-1, 1]
		end

	NW: COORDINATE
			-- Tuple modifier for East
		once
			Result := [-1, -1]
		end

	SE: COORDINATE
			-- Tuple modifier for South
		once
			Result := [1, 1]
		end

	SW: COORDINATE
			-- Tuple modifier for West
		once
			Result := [1, -1]
		end

	num_dir (int : INTEGER) : COORDINATE
		do
			inspect int
			when 1 then -- NORTH
				Result := N
			when 2 then -- NORTH-EAST
				Result := NE
			when 3 then -- EAST
				Result := E
			when 4 then -- SOUTH-EAST
				Result := SE
			when 5 then -- SOUTH
				Result := S
			when 6 then -- SOUTH-WEST
				Result := SW
			when 7 then -- WEST
				Result := W
			when 8 then -- NORTH-WEST
				Result := NW
			end
		end

	-- Constricts a coordinate to the bounds of the grid
	convert_bounds (row, col : INTEGER) : COORDINATE
		local
			shared_info_access : SHARED_INFORMATION_ACCESS
			shared_info : SHARED_INFORMATION
		do
			shared_info := shared_info_access.shared_info
			Result := [0, 0]
			if row > 5 then
				Result := [1, Result.col]
			elseif row < 1 then
				Result := [5, Result.col]
			else
				Result := [row, Result.col]
			end

			if col > 5 then
				Result := [Result.row, 1]
			elseif col < 1 then
				Result := [Result.row, 5]
			else
				Result := [Result.row, col]
			end
		end

end
