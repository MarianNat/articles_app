require 'spec_helper'

describe "Articles" do

  describe "Home page" do

    it "should have the content 'ArticlesApp'" do
      visit '/articles'
      page.should have_content('Articles')
    end
  end
end