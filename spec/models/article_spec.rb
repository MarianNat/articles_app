require 'spec_helper'

describe Article do

  before { @article = Article.new(name: "Example article", a_content: "Example article text") }

  subject { @article }

  it { should respond_to(:name) }
  it { should respond_to(:a_content) }

  it { should be_valid }

  describe "when name is not present" do
    before { @article.name = " " }
    it { should_not be_valid }
  end

  describe "when content is not present" do
    before { @article.a_content = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before {@article.name = "a" * 51}
    it { should_not be_valid }
  end

  describe "when name already exist" do
    before do
      article_copy = @article.dup
      article_copy.save
    end
    it { should_not be_valid }
  end

  describe "titles" do
    it "should return array" do
      Article.titles.should be_instance_of Array
    end
  end

  describe "add_dividers" do
    before { @article.save }
    it "should include -- " do
      Article.add_dividers(@article.id).name.should include("--")
    end
  end

end
