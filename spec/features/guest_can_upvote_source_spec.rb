require 'spec_helper'

feature 'upvote of a source' do
  before(:each) do
    @test_source = create(:source)
  end

  context 'guest can upvote a source' do
    it "allows guests to upvote a source", :js => true do
      visit '/'
      click_button('Up!')
      page.should have_content(1)
    end
  end
end