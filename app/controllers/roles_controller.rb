class RolesController < ApplicationController
  def index
    @students_with_new_appraisals = students_with_new_appraisals
  end

  def set_student_with_new_appraisal
    students_with_new_appraisals.update_all(new_appraisal: false)

    cookies.permanent[:role] = "student"
    redirect_to teams_url, notice: "Nova avaliação disponível"
  end

  def set_student
    cookies.permanent[:role] = "student"
    redirect_to teams_url
  end

  def set_appraiser
    cookies.permanent[:role] = "appraiser"
    redirect_to appraisals_url
  end

  private

  def students_with_new_appraisals
    Student.where(new_appraisal: true)
  end
end