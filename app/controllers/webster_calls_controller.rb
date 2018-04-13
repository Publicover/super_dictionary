class WebsterCallsController < ApplicationController
  def index
    @webster_calls = WebsterCall.all
  end

  def show
    @webster_call = WebsterCall.find(params[:id])
  end

  def new
    @webster_call = WebsterCall.new
  end

  def edit
  end

  def create
    @webster_call = WebsterCall.new(webster_call_params)
    @webster_call.definition = WebsterCall.webster_api(@webster_call.word)

    if @webster_call.save
      redirect_to @webster_call
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private
    def webster_call_params
      params.require(:webster_call).permit(:word, :definition)
    end
end
