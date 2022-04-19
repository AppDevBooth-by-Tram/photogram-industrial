class Like < ApplicationRecord
  belongs_to :fan
  belongs_to :photo
  validates :fan, presence: true
  validates :photo, presence: true
end
