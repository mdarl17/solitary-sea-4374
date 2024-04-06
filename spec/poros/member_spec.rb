require "rails_helper"

RSpec.describe Member, type: :class do 
	it "returns a ruby instance instantiated with member attributes" do
		member_attributes = {
			"_id": "5cf5679a915ecad153ab69c7",
			"allies": [
					"Ukano"
			],
			"enemies": [
					"Azula",
					"Ukano",
					"Team Avatar "
			],
			"photoUrl": "https://vignette.wikia.nocookie.net/avatar/images/4/40/Mai.png/revision/latest?cb=20090406114652",
			"name": "Mai",
			"affiliation": " Azula's team (formerly) Fire Nation Royal Fire Academy for Girls (formerly)"
		}

		expect(Member.new(member_attributes)).to be_a(Member)
		expect(Member.new(member_attributes).name).to be_a(String)
		expect(Member.new(member_attributes).name).to eq("Mai")
		expect(Member.new(member_attributes).allies).to be_an(Array)
		expect(Member.new(member_attributes).allies).to eq(["Ukano"])
		expect(Member.new(member_attributes).enemies).to be_an(Array)
		expect(Member.new(member_attributes).enemies.map(&:strip)).to eq(["Azula", "Ukano", "Team Avatar"])
		expect(Member.new(member_attributes).affiliations).to be_a(String)
		expect(Member.new(member_attributes).affiliations.strip).to eq("Azula's team (formerly) Fire Nation Royal Fire Academy for Girls (formerly)")
		expect(Member.new(member_attributes).photo).to be_a(String)
		expect(Member.new(member_attributes).photo.strip).to eq("https://vignette.wikia.nocookie.net/avatar/images/4/40/Mai.png/revision/latest?cb=20090406114652")
	end
end 