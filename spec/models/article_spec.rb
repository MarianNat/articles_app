require 'spec_helper'

describe Article do

  let(:article) { FactoryGirl.build(:article) }

    describe "class methods" do
      before(:each) { article.save }

      describe "#titles" do
        it "should return array" do
          expect(Article.titles).to be_instance_of Array
        end
      end

      describe "#add_dividers" do
        it "should include -- " do
          expect(Article.add_dividers(article.id).name).to match /^-{2}[a-z A-z 1-9]+-{2}$/
        end
      end
    end

    describe "validation" do

      it "when name is not present" do
        article.name = " "
        expect(article).not_to be_valid
      end

      it "when content is not present" do
        article.a_content = " "
        expect(article).not_to be_valid 
      end

      it "when name is too long" do
        article.name = "a" * 51
        expect(article).not_to be_valid
      end

      it "when name already exist" do
        article_copy = article.dup
        article_copy.save
        expect(article).not_to be_valid
      end
    end
end
