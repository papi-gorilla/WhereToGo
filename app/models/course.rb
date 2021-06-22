class Course < ApplicationRecord
  belongs_to :post, inverse_of: :courses
end
