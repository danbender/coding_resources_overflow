require 'spec_helper'

feature 'guest can post a source' do
  it 'displays a form' do
    visit ('/')
    click_link('Add a source')
    fill_in('Title', :with => 'Node Life')
    fill_in('Url', :with => 'http://www.nodelife.com')
  end
end