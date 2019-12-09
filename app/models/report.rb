class Report < ApplicationRecord
    has_many_attached :pre_damage_pictures
    has_many_attached :post_damage_pictures
    belongs_to :accident
    belongs_to :user


end
