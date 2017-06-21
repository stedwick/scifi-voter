class Category < ApplicationRecord
  acts_as_tree
  has_many :items
end
