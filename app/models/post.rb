class Post < ApplicationRecord
  has_one_attached :image

  validates :image, presence: true
  validate :image_type

  private def image_type
    return unless image.attached?

    if !image.content_type.in?(%w[image/png image/jpg image/jpeg image/gif])
      errors.add(:image, 'must be a PNG, JPG, JPEG, or GIF file')
    end
  end
end
