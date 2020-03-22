note
	description: "Summary description for {SHIP}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SHIP

inherit
	ENTITY

create
	make

feature -- attributes
	fuel : INTEGER
	life : INTEGER
	is_landed : BOOLEAN
	max_fuel : INTEGER
	max_life : INTEGER
	death_code : INTEGER

feature
	make (a_row, a_col, a_quadrant : INTEGER)
		do
			row := a_row
			col := a_col
			quadrant := a_quadrant
			create entity_type.make('E')
			id := 0
			is_landed := false
			fuel := 3
			life := 3
			max_life := 3
			max_fuel := 3
			death_code := 0
			movable := true
		end

feature -- command
	perish (perish_type : INTEGER)
		do
			death_code := perish_type
			life := 0
		end
	land
		do
			is_landed := true
		end

	liftoff
		do
			is_landed := false
		end

	use_fuel
		do
			fuel := fuel - 1
		end

	refuel (new_fuel : INTEGER)
		do
			fuel := fuel + new_fuel

			if fuel > max_fuel then
				fuel := max_fuel
			end
		end

feature --queries
	print_status : STRING
		do
			if is_landed then
				create Result.make_from_string("%N  Explorer status report:Stationary on planet surface at [")
			else
				create Result.make_from_string("%N  Explorer status report:Travelling at cruise speed at [")
			end

			Result.append(row.out)
			Result.append(",")
			Result.append(col.out)
			Result.append(",")
			Result.append(quadrant.out)
			Result.append("]")


			Result.append("%N  Life units left:")
			Result.append(life.out)
			Result.append(", ")
			Result.append("Fuel units left:")
			Result.append(fuel.out)
		end

	print_death_status : STRING
		do
			inspect death_code
			when 1 then
				Result := "Explorer got lost in space - out of fuel at Sector:"
				Result.append (row.out)
				Result.append (":")
				Result.append (col.out)
			when 2 then
				Result := "Explorer got devoured by blackhole (id: -1) at Sector:3:3"
			else
				Result := ""
			end
		end

feature {GALAXY}
	print_description : STRING
		do
			Result := ""
			Result.append ("fuel:")
			Result.append (fuel.out)
			Result.append ("/")
			Result.append (max_fuel.out)
			Result.append (", life:")
			Result.append (life.out)
			Result.append ("/")
			Result.append (max_life.out)
			Result.append (", landed?:")

			if is_landed then
				Result.append ("T")
			else
				Result.append ("F")
			end
		end
end
