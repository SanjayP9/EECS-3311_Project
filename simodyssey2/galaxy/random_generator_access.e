note
    description: "[
        Singleton for accessing RANDOM_GENERATOR.
    ]"
    author: "Kevin Banh"
    date: "April 30, 2019"
    revision: "1"

expanded class
	RANDOM_GENERATOR_ACCESS

feature -- Query
	output : STRING
		attribute
			Result := "  "
		end

	newline : INTEGER
		attribute
			Result := 0
		end

	reset_rng
		do
			output := "  "
			newline := 0
		end

    debug_gen: RANDOM_GENERATOR
            -- deterministic generator for debug mode
        once
            create result.make_debug
        end

    rchoose (low:INTEGER;high:INTEGER): INTEGER
    		--generates a number from low to high inclusive
    	require
    		valid_num:
    			low >= 0 and high > 0
    		valid_range:
    			low < high
        local
            gen: RANDOM_GENERATOR
            gen_access: RANDOM_GENERATOR_ACCESS
        do
            gen := gen_access.debug_gen
            Result := gen.num\\(high-low + 1) + low
            gen.forth

			output.append (Result.out)
			output.append (":[")
            output.append (low.out)
            output.append (",")
            output.append (high.out)
            output.append ("], ")
            newline := newline + 1

            if newline ~ 5 then
            	newline := 0
            	output.append ("%N  ")
            end
        end

invariant
	debug_gen = debug_gen

end
