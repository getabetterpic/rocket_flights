class Motor < ActiveRecord::Base
  validates_presence_of :name, :diameter_in_mm
end
