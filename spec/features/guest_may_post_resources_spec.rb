require 'spec_helper'

feature 'guest can post a resource' do
  it 'displays a form' do
    visit ('/')
    click_button('Add a Resource')
    fill_in('title', :with => 'Node Life')
    fill_in('url', :with => 'http://www.nodelife.com')
  end
end