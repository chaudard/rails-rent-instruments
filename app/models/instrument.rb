class Instrument < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :price, presence: true, numericality: { less_than_or_equal_to: 999,  greater_than: 0 }
  validates :image, presence: true
  validates :address, presence: true
  # validates :zipcode, presence: true
  # validates :city, presence: true
  # validates :country, presence: true
  mount_uploader :image, ImageUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch
  pg_search_scope :search_by_title_and_description,
  against: [ :title, :description ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

  def self.categories
    ['piano', 'guitare', 'saxophone', 'violon']
  end
end
