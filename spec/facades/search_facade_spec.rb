require "rails_helper"
require_relative "../test_data.rb"

RSpec.describe "SearchFacade", :vcr, type: :facade do 
	before(:each) do
		@facade = SearchFacade.new
		@um = TestData.new.unordered_members
  end
	describe "class methods" do 
		describe "#all_nation_members" do 
			it "returns ruby objects of all members of a given nation" do 
				nation_members = @facade.all_nation_members("Fire Nation")
				expect(nation_members).to be_an(Array)
				expect(nation_members.first).to be_a(Member)
				expect(nation_members.count).to eq(97)
				expect(nation_members.first.affiliations).to eq("Fire Nation")
				expect(nation_members.first.allies).to eq(["Fire Nation"])
				expect(nation_members.first.enemies).to eq(["Aang"])
				expect(nation_members.first.name).to eq("Afiko")
				expect(nation_members.first.photo).to eq("https://vignette.wikia.nocookie.net/avatar/images/2/24/Afiko.png/revision/latest?cb=20121121024128")
			end

			describe "#member_poros" do 
				it "converts a parsed http response hash into ruby objects for more convenient consumption by search results view" do 
					expect(@facade.member_poros([{
						id: 1,
						allies: ["Azula"],
						enemies: ["Sokka"],
						photoUrl: "https://airbender_photos.com",
						name: "Bully Guard",
						affiliation: "Fire Nation",
					}]).first).to be_a(Member)
				end

				it "sorts the poros by member name ascending" do
					unordered = @um
					ordered = @facade.member_poros(@um)
					
					expect(unordered[0][:name]).to eq("Guard captain")
					expect(unordered[1][:name]).to eq("Fire Nation company leader")
					expect(unordered[2][:name]).to eq("Tom-Tom")
					expect(unordered[3][:name]).to eq("Kori Morishita")
					expect(unordered[4][:name]).to eq("Bully guard")

					# converted to Member poros (reason for dot notation)
					expect(ordered[0].name).to eq("Bully guard")
					expect(ordered[1].name).to eq("Fire Nation company leader")
					expect(ordered[2].name).to eq("Guard captain")
					expect(ordered[3].name).to eq("Kori Morishita")
					expect(ordered[4].name).to eq("Tom-Tom")
				end
			end

			it "formats the Nation header, removing '+' sign and capitalizing each word" do 
				expect(@facade.nation_header("water+tribe+members")).to eq("Water Tribe Members")
			end
		end
	end 
end 