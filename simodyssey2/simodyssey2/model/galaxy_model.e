note
	description: "A default business model."
	author: "Jackie Wang"
	date: "$Date$"
	revision: "$Revision$"

class
	GALAXY_MODEL

inherit
	ANY
		redefine
			out
		end

create {GALAXY_MODEL_ACCESS}
	make

feature {NONE} -- Initialization
	make
			-- Initialization for `Current'.
		do
			create mode_string.make_from_string(" ok%N  Welcome! Try test(3,5,7,15,30)")
			create not_ingame_msg.make_from_string("  Negative on that request:no mission in progress.")
			create error_msg.make_empty
			curr_state := 0
			curr_sub_state := 0
		end

feature -- model attributes
	not_ingame_msg : STRING
	g : detachable GALAXY
	test_mode: BOOLEAN
	ingame : BOOLEAN

	curr_state : INTEGER
	curr_sub_state : INTEGER
	mode_string : STRING
	error_msg : STRING

	shared_info_access : SHARED_INFORMATION_ACCESS
	shared_info : SHARED_INFORMATION
		attribute
			Result := shared_info_access.shared_info
		end

	direction_helper : DIRECTION_UTILITY

feature -- model operations
	play
		do
			test(3, 5, 7, 15, 30, false)
		end

	test (a_threshold: INTEGER_32 ; j_threshold: INTEGER_32 ; m_threshold: INTEGER_32 ; b_threshold: INTEGER_32 ; p_threshold: INTEGER_32; is_test : BOOLEAN)
		do
			if not ingame then
				-- threshold check
				if a_threshold < j_threshold and j_threshold < m_threshold and m_threshold < b_threshold and
				   b_threshold < p_threshold  then
					if is_test then
						mode_string := "test"
					else
						mode_string := "play"
					end

					curr_sub_state := 0
					curr_state := curr_state + 1

					shared_info.test (a_threshold, j_threshold, m_threshold, b_threshold, p_threshold)
					ingame := true

					create g.make

					mode_string.append (", ok")

					test_mode := is_test
				else
					-- TODO:
					-- err: "Thresholds should be non-decreasing order."
				end
			else
				if test_mode then
					mode_string := "test, error"
				else
					mode_string := "play, error"
				end

				curr_sub_state := curr_sub_state + 1
				mode_string.append ("%N  To start a new mission, please abort the current one first.")
			end
		end

	abort
		do
			if ingame then

				g := void
				ingame := false

				curr_sub_state := curr_sub_state + 1
				mode_string := " ok%N  Mission aborted. Try test(3,5,7,15,30)"
			else
				invalid_command_ingame
			end
		end

	land
		local
			planet_tuple : TUPLE[ error_code : INTEGER; planet : detachable PLANET]
			update_code : INTEGER
		do
			if attached g as galaxy then
				if test_mode then
					mode_string := "test"
				else
					mode_string := "play"
				end

				planet_tuple := galaxy.is_valid_landing


				if attached planet_tuple.planet as planet then
					planet.land
					galaxy.ship.land

					-- check end conditions
					if planet.has_life then
						if test_mode then
							mode_string := " mode:test"
						else
							mode_string := " mode:play"
						end

						mode_string.append (", ok%N  Tranquility base here - we've got a life!")
						ingame := false
						g := void
					else
						if test_mode then
							mode_string := "test"
						else
							mode_string := "play"
						end

						mode_string.append (", ok%N  Explorer found no life as we know it at Sector:")
						mode_string.append (galaxy.ship.row.out)
						mode_string.append (":")
						mode_string.append (galaxy.ship.col.out)

						update_code := galaxy.update
					end

					curr_state := curr_state + 1
					curr_sub_state := 0
				else
					invalid_command_land (planet_tuple.error_code)
				end
			else
				invalid_command_ingame
			end
		end

	liftoff
		local
			update_code : INTEGER
		do
			if ingame then
				if test_mode then
					mode_string := "test"
				else
					mode_string := "play"
				end

				if attached g as galaxy then
					if galaxy.ship.is_landed then
						galaxy.ship.liftoff

						mode_string.append (", ok%N  Explorer has lifted off from planet at Sector:")
						mode_string.append (galaxy.ship.row.out)
						mode_string.append (":")
						mode_string.append (galaxy.ship.col.out)

						update_code := galaxy.update
						curr_state := curr_state + 1
						curr_sub_state := 0
					else
						invalid_command_liftoff(2)
					end
				end

			else
				invalid_command_ingame
			end
		end

	status
		do
			if ingame then
				if test_mode then
					mode_string := "test, ok"
				else
					mode_string := "play, ok"
				end

				if attached g as galaxy then
					mode_string.append (galaxy.ship.print_status)
				end

				curr_sub_state := curr_sub_state + 1
			else
				invalid_command_ingame
			end
		end

	wormhole
		local
			error_code : INTEGER
			update_code : INTEGER
		do
			if ingame then
				if test_mode then
					mode_string := "test"
				else
					mode_string := "play"
				end

				if attached g as galaxy then
					error_code := galaxy.wormhole (galaxy.ship)
					update_code := galaxy.update

					if error_code ~ 0 then
						curr_state := curr_state + 1
						curr_sub_state := 0

						mode_string.append (", ok")
					else
						invalid_command_wormhole(error_code)
					end
				end
			else
				invalid_command_ingame
			end
		end

	move (dir : INTEGER_32)
		local
			direction : COORDINATE
			update_code : INTEGER
		do
			if ingame then
				if test_mode then
					mode_string := "test"
				else
					mode_string := "play"
				end

				if attached g as galaxy then
					if galaxy.ship.is_landed then
						invalid_command_move(2)
					else
						direction := direction_helper.num_dir(dir)
						direction := direction_helper.convert_bounds (galaxy.ship.row + direction.row, galaxy.ship.col + direction.col)
						if galaxy.move(galaxy.ship, direction) then
							curr_state := curr_state + 1
							curr_sub_state := 0
							galaxy.ship.use_fuel
							update_code := galaxy.update

							if update_code /~ 0 then
								mode_string := " mode:"

								if test_mode then
									mode_string.append ("test, ok")
								else
									mode_string.append ("play, ok")
								end

								mode_string.append ("%N  ")
								mode_string.append (galaxy.ship.print_death_status)
								mode_string.append ("%N  The game has ended. You can start a new game.")

								mode_string.append (galaxy.print_description(test_mode))
								mode_string.append (galaxy.out)

								if test_mode then
									mode_string.append ("%N  ")
									mode_string.append (galaxy.ship.print_death_status)
									mode_string.append ("%N  The game has ended. You can start a new game.")
								end

								ingame := false
								g := void
							else
								mode_string.append (", ok")
							end

						else
							invalid_command_move(3)
						end
					end
				end
			else
				invalid_command_ingame
			end
		end

	pass
		local
			update_code : INTEGER
		do
			if ingame then
				if attached g as galaxy then
					if test_mode then
						mode_string := "test, ok"
					else
						mode_string := "play, ok"
					end
					update_code := galaxy.update
					curr_state := curr_state + 1
					curr_sub_state := 0
				end
			else
				invalid_command_ingame
			end
		end

	reset
			-- Reset model state.
		do
			make
		end

feature {NONE}

	invalid_command_ingame
		require
			in_game: not ingame
		do
			mode_string := " error%N  Negative on that request:no mission in progress."
			error_msg := not_ingame_msg
			curr_sub_state := curr_sub_state + 1
		end

	invalid_command_land (error_code : INTEGER)
		do
			if attached g as galaxy then
				mode_string.append (", error%N  Negative on that request:")
				inspect error_code
				when 1 then
					mode_string.append ("no mission in progress")
				when 2 then
					mode_string.append ("already landed on a planet at Sector:")
					mode_string.append (galaxy.ship.row.out)
					mode_string.append (":")
					mode_string.append (galaxy.ship.col.out)
				when 3 then
					mode_string.append ("no yellow dwarf at Sector:")
					mode_string.append (galaxy.ship.row.out)
					mode_string.append (":")
					mode_string.append (galaxy.ship.col.out)
				when 4 then
					mode_string.append ("no planets at Sector:")
					mode_string.append (galaxy.ship.row.out)
					mode_string.append (":")
					mode_string.append (galaxy.ship.col.out)
				when 5 then
					mode_string.append ("no unvisited attached planet at Sector:")
					mode_string.append (galaxy.ship.row.out)
					mode_string.append (":")
					mode_string.append (galaxy.ship.col.out)
				end

				error_msg := not_ingame_msg
				curr_sub_state := curr_sub_state + 1
			end
		end

	invalid_command_liftoff (error_code : INTEGER)
		do
			if attached g as galaxy then
				mode_string.append (", error%N  Negative on that request:")
				inspect error_code
				when 1 then
					mode_string.append ("no mission in progress")
				when 2 then
					mode_string.append ("you are not on a planet at Sector:")
					mode_string.append (galaxy.ship.row.out)
					mode_string.append (":")
					mode_string.append (galaxy.ship.col.out)
				end

				error_msg := not_ingame_msg
				curr_sub_state := curr_sub_state + 1
			end
		end

	invalid_command_move (error_code : INTEGER)
		do
			if attached g as galaxy then
				mode_string.append (", error%N  Negative on that request:")
				inspect error_code
				when 1 then
					mode_string.append ("no mission in progress")
				when 2 then
					mode_string.append ("you are currently landed at Sector:")
					mode_string.append (galaxy.ship.row.out)
					mode_string.append (":")
					mode_string.append (galaxy.ship.col.out)
				when 3 then
					if test_mode then
						mode_string := "test,"
					else
						mode_string := "play,"
					end
					mode_string.append (" error%N  Cannot transfer to new location as it is full.")
				end

				error_msg := not_ingame_msg
				curr_sub_state := curr_sub_state + 1
			end
		end

	invalid_command_wormhole (error_code : INTEGER)
		do
			if attached g as galaxy then
				mode_string := " error%N  Negative on that request:"
				inspect error_code
				when 1 then
					mode_string.append ("no mission in progress")
				when 2 then
					if test_mode then
						mode_string := "test,"
					else
						mode_string := "play,"
					end
					mode_string.append (" error%N  Negative on that request:you are currently landed at Sector:")
					mode_string.append (galaxy.ship.row.out)
					mode_string.append (":")
					mode_string.append (galaxy.ship.col.out)
				when 3 then
					if test_mode then
						mode_string := "test,"
					else
						mode_string := "play,"
					end
					mode_string.append (" error%N  Explorer couldn't find wormhole at Sector:")
					mode_string.append (galaxy.ship.row.out)
					mode_string.append (":")
					mode_string.append (galaxy.ship.col.out)
				end

				error_msg := not_ingame_msg
				curr_sub_state := curr_sub_state + 1
			end
		end
feature -- queries
	out : STRING
		do
			create Result.make_from_string ("  ")
			Result.append ("state:")
			Result.append (curr_state.out)
			Result.append (".")
			Result.append (curr_sub_state.out)

			if ingame then
				Result.append (", mode:")
			else
				Result.append(",")
			end

			Result.append (mode_string)

			if attached g as galaxy then
				if curr_sub_state < 1 then
					Result.append (galaxy.print_description(test_mode))
					Result.append (galaxy.out)
				end
			end
		end
end



