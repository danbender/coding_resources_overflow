require 'spec_helper'

feature 'edit a source' do
  before(:each) do
    @test_source = Source.new
    @test_source.title = "Javascript is awesome"
    @test_source.url = "http://www.javascript.com"
    @test_source.save
  end

  context 'guest can edit a source' do
    it "allows guests to edit a source", :js => true do
      visit '/'
      find('.edit-source-button').click
      fill_in('Title', with: 'Javascript is freaking siiick.')
      fill_in('Url', with: 'http://www.feature-crush.com')
      click_button('Update Source')
      page.should have_content('Javascript is freaking siiick.')
    end
  end
end