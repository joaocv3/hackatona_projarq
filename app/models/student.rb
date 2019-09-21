class Student < ApplicationRecord
  MAX = 5
  belongs_to :team
  belongs_to :course

  validate :team_size

  private

  def team_size
    if Student.where(team: team).size == MAX
      errors.add(:team, "is full!")
    end
  end

end
