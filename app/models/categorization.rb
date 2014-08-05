class Categorization < ActiveRecord::Base
  belongs_to :kitten
  belongs_to :category

  validates :category_id, presence: true
  validates :category_id, uniqueness: { scope: :kitten, message: 'has already been taken' }
end
