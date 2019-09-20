class Student < ApplicationRecord
  belongs_to :team
  belongs_to :course
end
