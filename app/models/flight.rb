class Flight < ActiveRecord::Base
  belongs_to :rocket
  belongs_to :motor
end
