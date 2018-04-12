class JohnsonCallsController < ApplicationController
  # before_filter :require_user
  # before_filter :set_current_user

  def index
    @johnson_calls = JohnsonCall.all
  end

  def show
    @johnson_call = JohnsonCall.find(params[:id])
  end

  def new
    @johnson_call = JohnsonCall.new
  end

  def edit
  end

  def create
    @johnson_call = JohnsonCall.new(johnson_call_params)
    @johnson_call.definition = JohnsonCall.johnson_api(@johnson_call.word)

    if @johnson_call.save
      redirect_to @johnson_call
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private
    def johnson_call_params
      params.require(:johnson_call).permit(:word, :definition)
    end
end
