class DashboardsController < ApplicationController
  before_action :logged_in?

  def index
    # @all_defs = []
    # @all_defs << OxfordWord.new('cake')
    # @all_defs = all_defs
  end

  def new
    @dashboard = Dashboard.new
  end

  def create
    @dashboard = Dashboard.new(dashboard_params)
    @dashboard.word = params[:word]
    redirect_to @dashboard, alert: "Here's your word."
  end

  def show
    # @dashboard = Dashboard.find(params[:id])
  end

  private

  def dashboard_params
    params.require(:dashboard).permit(:word)
  end
end
