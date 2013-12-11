class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: {maximum: 50}
  validates :a_content, presence: true

  class << self
    def titles
      titles = Array.new
      all.each do |article|
        titles.push article.name
      end
      titles
    end

    def add_dividers(id)
      article = find id
      article.name = ' -- ' + article.name + ' -- '
      article
    end

  end
end
