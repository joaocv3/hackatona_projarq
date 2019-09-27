class RolesController < ApplicationController
  def index
  end

  def set_student
    cookies.permanent[:role] = "student"
    redirect_to teams_url
  end
  def set_appraiser
    cookies.permanent[:role] = "appraiser"
    redirect_to appraisals_url
  end
end