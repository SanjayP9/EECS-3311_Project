note
	description: "Summary description for {MOVABLE_ENTITY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	MOVABLE_ENTITY

inherit
	ENTITY

feature -- attribute
	turns_left : INTEGER
	fuel, max_fuel : INTEGER
	life, max_life : INTEGER
	reproduction_turns : INTEGER
	death_code : INTEGER
	killer : detachable ENTITY

feature -- commands
	override_turns (turns : INTEGER)
		do
			turns_left := turns
		end

	override_reproduction (turns : INTEGER)
		do
			reproduction_turns := turns
		end

	decrement_turn
		do
			turns_left := turns_left - 1
		end

	decrement_reproduction
		do
			reproduction_turns := reproduction_turns - 1
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

	perish (a_death_code : INTEGER; entity : detachable ENTITY)
		do
			fuel := 0
			life := 0
			movable := false
			death_code := a_death_code
			killer := entity
		end

	print_death_status : STRING
		deferred end

feature {GALAXY} -- queries
	print_description : STRING
		deferred end
end
