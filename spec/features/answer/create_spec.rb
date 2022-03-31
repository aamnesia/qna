require 'rails_helper'

feature 'User can create answer', %q{
  In order to get help to solve problem
  As an authenticated user
  I'd like to be able to answer the question
} do

  given(:user) { create(:user) }
  given(:question) { create(:question, user: user) }

  describe 'Authenticated user' do
    background do
      sign_in(user)

      visit question_path(question)
    end

    scenario 'answers a question' do
      fill_in 'Body', with: 'text text text'
      click_on 'Answer'

      expect(page).to have_content 'Your answer successfully created.'
      expect(page).to have_content 'text text text'
    end

    scenario 'gives answer with errors' do
      click_on 'Answer'

      expect(page).to have_content 'Not saved.'
    end
  end

  scenario 'Unauthenticated user tries to answer question' do
    visit question_path(question)
    click_on 'Answer'

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
