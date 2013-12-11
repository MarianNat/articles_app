require 'spec_helper'

class ArticlesTest

  describe "Articles" do

    describe "Home page" do

      it "should have the content 'ArticlesApp'" do
        visit '/article/2'
        page.should have_content('ArticlesApp')
      end
    end
  end

end
