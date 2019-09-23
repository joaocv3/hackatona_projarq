class Student < ApplicationRecord
  MAX = 5
  belongs_to :team
  belongs_to :course

  validate :team_size
  validate :team_courses

  private

  def team_size
    if team.students.size == MAX
      errors.add(:team, "is full!")
    end
  end

  def team_courses
    if (team.students.size == MAX - 1) && (team.students.map(&:course).uniq.size == 1)
      if team.students.sample.course == course
        errors.add(:team, "needs students from at least 2 different courses!")
      end
    end
  end
end
