class Level < ApplicationRecord
  has_many :blocks, dependent: :destroy
  has_many :user_progresses, dependent: :destroy
  has_many :users, through: :user_progresses
  has_many :hints, dependent: :destroy

  enum :level_type, { "drag-and-drop" => 0, debugging: 1, "fill-in-the-blank" => 2 }
end
