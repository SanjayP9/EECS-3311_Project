note
	description: "Singleton access to the default business model."
	author: "Jackie Wang"
	date: "$Date$"
	revision: "$Revision$"

expanded class
	GALAXY_MODEL_ACCESS

feature
	m: GALAXY_MODEL
		once
			create Result.make
		end

invariant
	m = m
end




