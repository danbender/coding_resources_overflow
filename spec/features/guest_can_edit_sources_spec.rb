require 'spec_helper'

feature 'edit a source' do
  before(:each) do
    @test_source = create(:source)
  end

  context 'guest can edit a source' do
    it "allows guests to edit a source", :js => true do
      visit '/'
      find('.edit-source-button').click
      fill_in('source[title]', with: 'Javascript is freaking siiick.')
      fill_in('source[url]', with: 'http://www.feature-crush.com')
      click_button('Update Source')
      page.should have_content('Javascript is freaking siiick.')
    end
  end
end