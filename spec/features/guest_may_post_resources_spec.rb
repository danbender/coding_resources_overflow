require 'spec_helper'

feature 'guest can post a source' do
  it 'creates a resource' do
    visit ('/')
    click_link('Add a source')
    fill_in('Title', :with => 'Node Life')
    fill_in('Url', :with => 'http://www.nodelife.com')
    click_button('Create Source')
    page.should have_content('Node Life')
  end
end