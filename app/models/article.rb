class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: {maximum: 50}
  validates :a_content, presence: true
end
