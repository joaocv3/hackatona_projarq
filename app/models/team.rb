class Team < ApplicationRecord
  has_many :students

  validates_presence_of :name
  
  def self.suggest_for(student)
    Team
      .all
      .reject do |team|
        team_full?(team) || ( team_missing_different_courses?(team) && new_student_course_already_in_team?(team, student) )
      end
  end

  def self.team_full?(team)
    team.students.size == ::Constants::MAX_STUDENTS_PER_TEAM
  end

  def self.team_missing_different_courses?(team)
    team.students.map(&:course).uniq.size == ( ::Constants::DIFFERENT_COURSES_PER_TEAM  - 1 )
  end

  def self.new_student_course_already_in_team?(team, student)
    team.students.map(&:course).include?(student.course)
  end
end
