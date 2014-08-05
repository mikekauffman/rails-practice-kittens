class Kitten < ActiveRecord::Base

  validates :image, presence: true

  has_many :categorizations
  has_many :categories, -> { order('name') }, through: :categorizations

end