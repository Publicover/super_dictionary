class UrbanCallsController < ApplicationController
  def index
    @urban_calls = UrbanCall.all
  end

  def show
    @urban_call = UrbanCall.find(params[:id])
  end

  def new
    @urban_call = UrbanCall.new
  end

  def edit
  end

  def create
    @urban_call = UrbanCall.new(urban_call_params)
    @urban_call.definition = UrbanCall.urban_api(@urban_call.word)

    if @urban_call.save
      redirect_to @urban_call
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private
    def urban_call_params
      params.require(:urban_call).permit(:word, :definition)
    end
end
