class School < ApplicationRecord
  # Association to link to many courses
  has_many :courses
end
