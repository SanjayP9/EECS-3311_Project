note
	description: "Summary description for {MOVABLE_ENTITY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	MOVABLE_ENTITY

inherit
	ENTITY
		redefine
			movable
		end

feature -- attribute
	turns_left : INTEGER
	movable : BOOLEAN

feature -- commands
	override_turns (turns : INTEGER)
		do
			turns_left := turns
		end

	decrement_turn
		do
			turns_left := turns_left - 1
		end

feature {GALAXY} -- queries
	print_description : STRING
		deferred end

invariant
	is_movable: movable ~ true

end
