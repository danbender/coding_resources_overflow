require 'spec_helper'

feature 'delete a source' do
  before(:each) do
    @test_source = Source.new
    @test_source.title = "Javascript is awesome"
    @test_source.url = "http://www.javascript.com"
    @test_source.save
  end

  context 'guest can delete a source' do
    it "allows guests to delete a source", :js => true do
      visit '/'
      find('.delete-button').click
      page.should_not have_content('Javascript is awesome')
    end
  end
end