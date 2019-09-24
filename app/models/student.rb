class Student < ApplicationRecord
  belongs_to :team
  belongs_to :course


  validates_presence_of :name
  validate :team_size, if: :team_present?
  validate :team_with_different_courses, if: :team_present?

  private

  def team_present?
    team.present?
  end

  def team_size
    if team.students.size == Constants::MAX_STUDENTS_PER_TEAM
      errors.add(:team, "is full!")
    end
  end

  def team_with_different_courses
    if team_almost_full? && team_missing_students_from_different_courses? && new_student_course_already_in_team?
      errors.add(:team, "needs students from at least #{Constants::DIFFERENT_COURSES_PER_TEAM} different courses!")
    end
  end

  def team_almost_full?
    team.students.size == Constants::MAX_STUDENTS_PER_TEAM - ( Constants::DIFFERENT_COURSES_PER_TEAM - 1 )
  end

  def team_missing_students_from_different_courses?
    team.students.map(&:course).uniq.size == ( Constants::DIFFERENT_COURSES_PER_TEAM - 1 )
  end

  def new_student_course_already_in_team?
    team.students.map(&:course).include?(course)
  end
end
