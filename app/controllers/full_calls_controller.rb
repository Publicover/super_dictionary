class FullCallsController < ApplicationController
  def index
    @full_calls = FullCall.all
  end

  def show
    @full_call = FullCall.find(params[:id])
  end

  def new
    @full_call = FullCall.new
  end

  def edit
    @full_call = FullCall
  end

  def create
    @full_call = FullCall

    @full_call = FullCall.new(full_call_params)
    @full_call.definition = FullCall.oxford_api(@full_call.word)

    if @full_call.save
      redirect_to @full_call
    else
      render 'new'
    end
  end

  def update
    @full_call = FullCall
  end

  def destroy
    @full_call = FullCall
  end

  private
    def full_call_params
      params.require(:full_call).permit(:word, :definition)
    end
end
