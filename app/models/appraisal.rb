class Appraisal < ApplicationRecord
  belongs_to :team
  belongs_to :appraiser

  validate :appraisal_amount
  validate :has_already_voted

  private

  def appraisal_amount
    if !self.working_software or self.working_software < 0 or self.working_software > 5
      errors.add(:working_software, "has invalid amount!")
    end
    if !self.process or self.process < 0 or self.process > 5
      errors.add(:process, "has invalid amount!")
    end
    if !self.pitch or self.pitch < 0 or self.pitch > 5
      errors.add(:pitch, "has invalid amount!")
    end
    if !self.inovation or self.inovation < 0 or self.inovation > 5
      errors.add(:inovation, "has invalid amount!")
    end
    if !self.team_formation or self.team_formation < 0 or self.team_formation > 5
      errors.add(:team_formation, "has invalid amount!")
    end
  end

  def has_already_voted
    if Appraisal.find_by(Appraiser == self.appraiser, Team == self.team)
      errors.add(:appraiser, "has already voted on current team!")
    end
  end

end
