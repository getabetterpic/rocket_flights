class RocketsController < ApplicationController
  before_action :authenticate, only: [:create, :update, :delete]
end
