require "rails_helper"

RSpec.describe RobotsController, type: :feature, js: true do

  describe "#index" do
    it 'with valid input' do
      visit '/'

      fill_in :input, with: "PLACE 1,2,NORTH\nMOVE\nLEFT\nREPORT"
      click_on 'Submit'
      within '#movement-result' do
        expect(page).to have_content '1,3,WEST'
      end
    end

    it 'with valid input' do
      visit '/'

      fill_in :input, with: "PLACE 1,2,NORTH\nMOVEE\nLEFT\nREPORT"
      click_on 'Submit'
      within '#movement-result' do
        expect(page).to have_content ' Invalid Command.'
      end
    end
  end
end
