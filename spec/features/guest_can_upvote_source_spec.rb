require 'spec_helper'

feature 'upvote of a source' do
  before(:each) do
    @test_source = Source.new
    @test_source.title = "Javascript is awesome"
    @test_source.url = "http://www.javascript.com"
    @test_source.save
  end

  context 'guest can upvote a source' do
    it "allows guests to upvote a source" do
      visit '/'
      find('.upvote_count').click
      page.should have_content(1)
    end
  end
end