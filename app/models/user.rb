class User < ApplicationRecord
  has_one_attached :avatar

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  validate :avatar_must_be_a_supported_image

  private

  def avatar_must_be_a_supported_image
    return unless avatar.attached?

    unless %w[image/jpeg image/png image/webp].include?(avatar.blob.content_type)
      errors.add(:avatar, "must be a JPEG, PNG, or WebP image")
    end

    errors.add(:avatar, "must be smaller than 5 MB") if avatar.blob.byte_size > 5.megabytes
  end
end
