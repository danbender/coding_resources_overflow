# require 'spec_helper'

# feature 'add a comment' do
#   before(:each) do
#     @test_source = Source.new
#     @test_source.title = "Javascript is awesome"
#     @test_source.url = "http://www.javascript.com"
#     @test_source.save
#   end

#   context 'guest can add a comment to an existing source' do
#     it "allows guests to delete a source", :js => true do
#       visit '/'
#       find('.comment-button').click
#       fill_in('comment-body')
#       click_button('Add Comment')
#     end
#   end
# end
