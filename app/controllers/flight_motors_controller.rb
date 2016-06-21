class FlightMotorsController < ApplicationController
  before_action :authenticate, only: [:create, :update, :delete]
end
