class Planet < ApplicationRecord
    has_many :missions
    has_many :scientests, through: :missions
end
