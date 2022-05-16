class Board < ApplicationRecord
  belongs_to :user
  has_many :applausers, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :incident, presence: true, length: { maximum: 65_535 }
end
