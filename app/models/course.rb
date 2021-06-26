class Course < ApplicationRecord
  belongs_to :post, inverse_of: :courses

  validates :day, presence: true
  validates :departure_point, length: {maximum: 20}, presence: true
  validates :arrival_point, length: {maximum: 20}, presence: true
  validates :way_point1, length: {maximum: 20}
  validates :way_point2, length: {maximum: 20}
  validates :way_point3, length: {maximum: 20}
  validates :way_point4, length: {maximum: 20}
  validates :way_point5, length: {maximum: 20}
  validates :way_point6, length: {maximum: 20}
  validates :way_point7, length: {maximum: 20}
  validates :way_point8, length: {maximum: 20}

end
