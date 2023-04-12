class Golfcourse < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/golfcourse1.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @golfcourse = Golfcourse.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @golfcourse = Golfcourse.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @golfcourse = Golfcourse.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @golfcourse = Golfcourse.where("title LIKE?","%#{word}%")
    else
      @golfcourse = Golfcourse.all
    end
  end

end
