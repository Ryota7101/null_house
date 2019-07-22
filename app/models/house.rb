class House < ApplicationRecord
  belongs_to :user
  
  has_many :favorites, foreign_key: 'house_id', dependent: :destroy
  has_many :users, through: :favorites
  has_many :comments
  
  validates :title, presence: true,length: { maximum: 50 }
  validates :overview, presence: true,length: { maximum: 140 }
  validates :layout, presence: true,length: { maximum: 140 }
  validates :price, presence: true
  validates :land_area, presence: true,length: { maximum: 140 }
  validates :building_area, presence: true
  validates :age_of_a_building, presence: true
  validates :adoress, presence: true,length: { maximum: 140 }
  validates :sell_or_lend, presence: true
  
  def self.search(search) #ここでのself.はUser.を意味する
    if search
      where(['title LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
    else
      all #全て表示。User.は省略
    end
  end
end
