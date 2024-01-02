class MenusSection < ApplicationRecord
  belongs_to :menu, foreign_key: :menu_id
  belongs_to :section, foreign_key: :section_id
end
