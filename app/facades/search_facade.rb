class SearchFacade 
	def all_nation_members(nation)
		members = NationsService.new.get_all_members(nation)
		member_poros(members)
	end
	
	def member_poros(member_hash)
		member_hash.map do |member|
			Member.new(member)
		end
	end
end