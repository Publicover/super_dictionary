class DashboardsController < ApplicationController
  before_action :logged_in?

  def index
    @full_call = FullCall.new
  end
end
