class Team < ApplicationRecord
  has_many :students
  has_many :appraisals

  validates_presence_of :name
  
  def self.all_ordered_by_appraisal_points
    Team
      .all
      .sort_by { |team| team.appraisal_points }
      .reverse
  end

  def self.all_appraised?
    all_appraisers = Appraiser.all

    Team
      .all
      .all?{|t| ( all_appraisers - t.appraisals.map(&:appraiser)).empty? }
  end

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
    team.students.map(&:course).uniq.size == ::Constants::DIFFERENT_COURSES_PER_TEAM - 1
  end

  def self.new_student_course_already_in_team?(team, student)
    team.students.map(&:course).include?(student.course)
  end

  def times_appraised
    appraisals.count
  end

  def list_students
    students.map(&:name).join(", ")
  end

  def list_courses
    students.map{|student| student.course.name }.uniq.join(", ")
  end

  def appraised_by_all_appraisers?
    Appraiser.count == times_appraised 
  end

  def missing_appraisal_by
    Appraiser.all - appraisals.map(&:appraiser)
  end

  def list_missing_appraisal_by
    missing_appraisal_by.map(&:name).join(", ")
  end

  def appraisal_points
    appraisals.reduce 0 do |total, appraisal|
      appraisal.working_software + appraisal.process + appraisal.pitch + appraisal.inovation + appraisal.team_formation + total
    end
  end
end
