class Appraiser < ApplicationRecord
  has_many :appraisals

  validates_presence_of :name
end
