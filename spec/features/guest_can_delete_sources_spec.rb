require 'spec_helper'

feature 'delete a source' do
  before(:each) do
    @test_source = create(:source)
  end

  context 'guest can delete a source' do
    it "allows guests to delete a source", :js=>true do
      visit root_path
      click_button('✖')
      page.should_not have_content('Javascript is awesome')
    end
  end
end