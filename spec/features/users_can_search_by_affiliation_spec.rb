require "rails_helper"

feature "users can search by affiliation", :vcr, type: :feature do 
	scenario "users submits affiliation with drop down box" do
		visit root_path

		select "Fire Nation", from: :nation

		click_on "Search For Members"

		expect(current_path).to eq(search_path)

		expect(page).to have_content("Number of members: 97")

		within(first(".name")) do 
			expect(page).to have_content("Name: Afiko")
		end

		expect(page).to have_css(".photo")

		within(first(".allies")) do 
			expect(page).to have_content("Allies: Fire Nation")
		end

		within(first(".enemies")) do 
			expect(page).to have_content("Enemies: Aang")
		end

		within(first(".affiliations")) do 
			expect(page).to have_content("Affiliations: Fire Nation")
		end
	end
end 