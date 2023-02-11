class Cat < ApplicationRecord
    validates :color, :birth_date, :name, :sex, :description, presence: true
end