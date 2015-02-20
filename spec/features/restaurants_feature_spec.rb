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

  context 'viewing restaurants' do
    let!(:boka){Restaurant.create(name:'BOKA')}
    scenario 'lets a user view a restaurant' do
      visit '/restaurants'
      click_link 'BOKA'
      expect(page).to have_content 'BOKA'
      expect(current_path).to eq "/restaurants/#{boka.id}"
    end
  end

  context 'editing restaurants' do
    before {Restaurant.create name: 'Coq au Vin'}
    scenario 'let a user edit a restaurant' do
      visit '/restaurants'
      click_link 'Edit Coq au Vin'
      fill_in 'Name', with: 'La Fourchette'
      click_button 'Update Restaurant'
      expect(page).to have_content 'La Fourchette'
      expect(current_path).to eq "/restaurants"
    end
  end

end