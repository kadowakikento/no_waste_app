class Food < ApplicationRecord
  belongs_to :user
  validates :name, :due_time, presence: true
end
