require 'rails_helper'

feature 'reviews' do
  before {Restaurant.create name: 'BOKA'}

  scenario 'allows users to leave a review' do
    visit '/restaurants'
    click_link 'Review BOKA'
    fill_in 'Thoughts', with: 'very good'
    select '4', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('very good')
  end
end