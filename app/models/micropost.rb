# frozen_string_literal: true

class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate  :picture_size

  SIZE_ERROR = 'should be less than 5MB'

  private

  def picture_size
    errors.add(:picture, SIZE_ERROR) if picture.size > 5.megabytes
  end
end
