class SearchFacade 
	def all_nation_members(nation)
		members = NationsService.new.get_all_members(nation)
		member_poros(members)
	end

	def member_poros(member_hash)
		members = member_hash.map do |member|
			Member.new(member)
		end
		
		members.sort_by do |member_poro|
			member_poro.name
		end
	end

	def nation_header(nation)
		nation.split("+")
					.map(&:capitalize)
					.join(" ")
	end
end