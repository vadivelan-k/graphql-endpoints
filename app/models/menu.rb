class Menu < ApplicationRecord
  MENU_STATES = ['open', 'close'].freeze

  has_many :menus_sections
  has_many :sections, through: :menus_sections

  validates :label, :state, :start_date, :end_date, presence: true
  validates :label, length: { maximum: 150 }
  validates :state, inclusion: { in: MENU_STATES }
  validates_date :end_date, on_or_after: :start_date
end
