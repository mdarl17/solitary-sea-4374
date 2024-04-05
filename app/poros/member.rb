class Member
	attr_reader :name, :photo, :allies, :enemies, :affiliations
	
	def initialize(attributes)
		@name = attributes[:name]
		@photo = attributes[:photoUrl]
		@allies = attributes[:allies]
		@enemies = attributes[:enemies]
		@affiliations = attributes[:affiliation]
	end
end