class OxfordCallsController < ApplicationController
  def index
    @oxford_calls = OxfordCall.all
  end

  def show
    @oxford_call = OxfordCall.find(params[:id])
  end

  def new
    @oxford_call = OxfordCall.new
  end

  def edit
  end

  def create
    @oxford_call = OxfordCall.new(oxford_call_params)
    @oxford_call.definition = OxfordCall.oxford_api(@oxford_call.word).flatten

    if @oxford_call.save
      redirect_to @oxford_call
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private

    def oxford_call_params
      params.require(:oxford_call).permit(:word, :definition)
    end
end
