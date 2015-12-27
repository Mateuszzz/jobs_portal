require 'rails_helper'

feature "Visit static pages" do

    scenario "Visit home page" do
        visit root_path
        
        expect(page).to have_title("e-library")
        expect(page).to have_selector('a', count: 5)
        #expect(all('a').count).to eq(5)
    end
end