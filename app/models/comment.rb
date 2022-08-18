class Comment < ApplicationRecord
  belongs_to :shopping_list
  validates :content, presence: true
end
