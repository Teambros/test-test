class Classroom < ApplicationRecord

  belongs_to :user
  has_many :studentlist

end
