require 'spec_helper'

describe "article create process", :type => :feature do
  it "should create article" do
    visit new_article_path
    within("#new_article") do
      fill_in 'article[name]', :with => 'example_name'
      fill_in 'article[a_content]', :with => 'example_content'
    end
    expect { click_button 'Send' }.to change(Article, :count).by(1)
  end
  it "should not create article" do
    visit new_article_path
    expect { click_button 'Send' }.not_to change(Article, :count)
  end
end

describe "removing articles via ajax" do
  it 'should remove article via ajax', :js=>true do
    5.times { |n| Article.create! name: "example_name#{n}", a_content: 'example_content' }
    visit articles_path
    expect(page).to have_content 'example_name0'
    first('.article .del_article').click
    expect(page).not_to have_content 'example_name0'
  end
end

describe "Animated display footer" do
  it 'should change footer opacity', :js=>true do
    visit articles_path
    opacity_before_scroll_down = page.evaluate_script "$('footer').css('opacity')"
    expect(opacity_before_scroll_down).to eql '0'
    page.evaluate_script "window.scrollTo(0, $(document).height())"
    sleep 1.1
    opacity_after_scroll_down = page.evaluate_script "$('footer').css('opacity')"
    expect(opacity_after_scroll_down).to eql '1'
    page.evaluate_script "window.scrollTo(0, $(document).height() - $(window).height() - 40)"
    sleep 1.1
    opacity_after_scroll_up = page.evaluate_script "$('footer').css('opacity')"
    expect(opacity_after_scroll_up).to eql '0'
  end
end  
