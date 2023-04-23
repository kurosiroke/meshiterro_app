class PostImage < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  validates :shop_name, presence: true
  validates :image, presence: true

  belongs_to :user
  belongs_to :post_image,optional: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpe')
    else
      image
    end
  end
    def favorited_by?(user)
      favorites.exists?(user_id: user.id)
    end
end