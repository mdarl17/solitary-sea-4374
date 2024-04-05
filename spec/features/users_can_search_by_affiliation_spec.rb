require "rails_helper"

feature "users can search by affiliation", type: :feature do 
	scenario "users submits affiliation with drop down box" do
		visit root_path

		select "Fire Nation", from: :nation

		click_on "Search For Members"

		expect(current_path).to eq(search_path)

		expect(page).to have_content("Number of members: 97")

		within(first(".name")) do 
			expect(page).to have_content("Name: Azula")
		end

		expect(page).to have_css(".photo")

		within(first(".allies")) do 
			expect(page).to have_content("Allies: Ozai, Zuko")
		end

		within(first(".enemies")) do 
			expect(page).to have_content("Enemies: Iroh, Zuko, Kuei, Long Feng, Mai, Ty Lee, Ursa")
		end

		within(first(".affiliations")) do 
			expect(page).to have_content("Affiliations Azula's team (formerly) Dai Li (formerly) Fire Nation Fire Nation Royal Family Fire Warriors Royal Fire Academy for Girls (formerly)")
		end
	end
end 