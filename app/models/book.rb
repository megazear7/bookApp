class Book < ActiveRecord::Base
  has_many :chapters, dependent: :destroy
  accepts_nested_attributes_for :chapters, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
