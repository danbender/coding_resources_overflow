require 'spec_helper'

feature 'add a comment' do

  before(:each) do
    @test_source = create(:comment)
  end

  context 'guest can add a comment to an existing source' do
    it "allows guests to delete a source", :js => true do
      visit '/'
      find('.comment-button').click
      fill_in('comment[body]', :with => "comments 4days")
      click_button('Create Comment')
    end
  end
end
