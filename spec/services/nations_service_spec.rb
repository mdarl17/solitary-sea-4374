require 'rails_helper'

describe NationsService do
  before(:each) do 
    @service = NationsService.new
  end

  context "class methods" do
    context "#get_all_members" do
      it "returns all members of a given nation" do
        fn_members = @service.get_all_members("Fire Nation")
        expect(fn_members.count).to be_an(Integer)
        expect(fn_members.count).to eq(97)
        expect(fn_members.first).to be_a(Hash)
      end

    context "#get_url"
      it "returns a symbolized hash of nation member data given a url" do 
        nation = "Fire Nation"
        url = "/api/v1/characters?perPage=100&affiliation=#{nation}"

        parsed_response = @service.get_url(url)
        expect(parsed_response).to be_an(Array)
        expect(parsed_response.first).to be_a(Hash)
        expect(parsed_response.first).to eq({
          :_id=>"5cf5679a915ecad153ab68ef",
          :allies=>["Azula"],
          :enemies=>["Sokka"],
          :photoUrl=>
            "https://vignette.wikia.nocookie.net/avatar/images/0/02/Bully_guard.png/revision/latest?cb=20120702232626",
          :name=>"Bully guard",
          :affiliation=>"Fire Nation"
        })
      end
		end

    context "conn" do
      it "returns a Faraday::Connection object" do 
        expect(@service.conn).to be_a(Faraday::Connection)
      end
    end
	end
end