require 'rails_helper'

feature "Home" do
  let(:user) { create(:user) }
  
  before do
    @player_1 = create(:player, avg: 2, hits: 3, bats: 6)
    @player_2 = create(:player, avg: 1)
    login_as(user, scope: :user)
  end
  
  scenario "Sort table (default)" do
    visit "pages/home"
    within(:xpath, "//table/tbody/tr[1]/td[1]") do
      expect(page).to have_content(@player_2.id)
    end
  end
  
  scenario "Sort table (avg column)" do
    visit "pages/home"
    click_link "AVG"
    within(:xpath, "//table/tbody/tr[1]/td[1]") do
      expect(page).to have_content(@player_1.id)
    end
  end
end