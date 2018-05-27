class Product < ApplicationRecord
  belongs_to :section
  validates :count, presence: true
  validates :description, presence: true
end
