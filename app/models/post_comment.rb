class PostComment < ApplicationRecord

  belongs_to :user
  belongs_to :golfcourse

  validates :comment, presence: true

end
