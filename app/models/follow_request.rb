class FollowRequest < ApplicationRecord
  belongs_to :recipient, class_name: "User"
  belongs_to :sender, class_name: "User"
  validates :sender, presence: true
  validates :recipient, presence: true, :uniqueness => { :scope => [:sender_id] }
  enum status: { pending: "pending", rejected: "rejected", accepted: "accepted" }

end
