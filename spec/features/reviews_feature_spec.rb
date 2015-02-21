require 'rails_helper'


def leave_review(thoughts, rating)
  visit '/restaurants'
  click_link 'Review BOKA'
  fill_in 'Thoughts', with: thoughts
  select rating, from: 'Rating'
  click_button 'Leave Review'
end


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

  scenario 'displays an average rating for all reviews' do
    leave_review('So so', '3')
    leave_review('Great', '5')
    expect(page).to have_content('Average rating: 4')
  end

end
