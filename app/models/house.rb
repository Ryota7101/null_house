class House < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites
  
  validates :title, presence: true,length: { maximum: 50 }
  validates :overview, presence: true,length: { maximum: 140 }
  validates :layout, presence: true,length: { maximum: 140 }
  validates :price, presence: true
  validates :land_area, presence: true,length: { maximum: 140 }
  validates :building_area, presence: true
  validates :age_of_a_building, presence: true
  validates :adoress, presence: true,length: { maximum: 140 }
  validates :sell_or_lend, presence: true
end
