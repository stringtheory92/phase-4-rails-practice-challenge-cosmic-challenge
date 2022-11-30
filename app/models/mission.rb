class Mission < ApplicationRecord

    belongs_to :scientist
    belongs_to :planet

    # validates :scientist_id, uniqueness: true, presence: true
    validate :one_time_per_mission

    def one_time_per_mission
        if Mission.where(scientist_id: self.scientist_id, planet_id: self.planet_id).exists?
            
            errors.add(:scientist_id, "Scientist already went on this mission")
        end
    end

end
