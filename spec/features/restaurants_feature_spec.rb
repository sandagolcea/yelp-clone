require 'rails_helper'

feature 'restaurants' do
  
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
    
    before do
      Restaurant.create(name: 'Art of the Table')
    end

    scenario 'display restaurants' do
      visit '/restaurants'
      expect(page).to have_content 'Art of the Table'
      expect(page).not_to have_content 'No restaurants'
    end

  end

  context 'creating restaurants' do
    scenario 'prompts user to fill in a form and displays the new resto'  do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'Art of the Table'
      click_button 'Create Restaurant'
      expect(page).to have_content 'Art of the Table'
      expect(current_path).to eq '/restaurants'
    end
  end

end