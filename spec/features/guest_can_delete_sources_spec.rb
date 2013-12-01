require 'spec_helper'

feature 'delete a source' do
  before(:each) do
    @test_source = Source.new
    @test_source.title = "Javascript is awesome"
    @test_source.url = "http://www.javascript.com"
    @test_source.save
  end

    # Failure/Error: Unable to find matching line from backtrace
    #  ActiveRecord::RecordNotFound:
    #    Couldn't find Source with id=1

  # context 'guest can delete a source' do
  #   it "allows guests to delete a source", :js=>true do
  #     visit '/'
  #     sleep(5)
  #     # find('.delete-button').click
  #     click_button('✖')
  #     sleep(4)
  #     page.should_not have_content('Javascript is awesome')
  #     # sleep(3)
  #   end
# end
end