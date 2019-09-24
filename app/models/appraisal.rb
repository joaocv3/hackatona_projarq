class Appraisal < ApplicationRecord
  belongs_to :team
  belongs_to :appraiser

  attr_accessor :working_software, :process, :pitch, :inovation, :team_formation

  validate :appraisal_amount
  validate :has_already_voted, if: :appraiser_present?

  validates_presence_of :working_software, :process, :pitch, :inovation, :team_formation

  private

  def appraiser_present?
    appraiser.present?
  end

  def appraisal_amount
    [:working_software, :process, :pitch, :inovation, :team_formation].each do |attribute_to_validate|
      if send(attribute_to_validate).present?
        if send(attribute_to_validate).to_i < 0 or send(attribute_to_validate).to_i > 5
          errors.add(attribute_to_validate, "has invalid amount!")
        end
      end
    end
  end

  def has_already_voted
    if appraiser.appraisals.map(&:team).include?(team)
      errors.add(:appraiser, "has already voted on current team!")
    end
  end
end
