require 'action_view'

# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    CAT_COLORS = %w(black white orange brown).freeze

    validates :name, :color, :sex, :birth_date, presence: true
    validates :color, inclusion: { in: CAT_COLORS, message: '%{value} is not a valid cat color' }
    validates :sex, inclusion: { in: %w(M F), message: '%{value} is not a valid sex'}

    def age
        time_ago_in_words(birth_date)
    end

end
