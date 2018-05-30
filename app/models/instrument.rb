class Instrument < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :price, presence: true, numericality: true
  validates :image, presence: true
  validates :address, presence: true
  validates :zipcode, presence: true
  validates :city, presence: true
  validates :country, presence: true
  mount_uploader :image, ImageUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
