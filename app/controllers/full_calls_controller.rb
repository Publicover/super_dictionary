class FullCallsController < ApplicationController
  before_action :set_full_call,
    only: [:show, :vote_oxford, :vote_webster, :vote_johnson, :vote_urban]

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
    # @full_call = FullCall
  end

  def create
    @full_call = FullCall.new(full_call_params)
    @full_call.oxford_def = OxfordCall.oxford_api(@full_call.word)
    @full_call.webster_def = WebsterCall.webster_api(@full_call.word)
    @full_call.johnson_def = JohnsonCall.johnson_api(@full_call.word)
    @full_call.urban_def = UrbanCall.urban_api(@full_call.word)

    if @full_call.save
      redirect_to @full_call
    else
      render 'new'
    end
  end

  def update
    # @full_call = FullCall
  end

  def destroy
    # @full_call = FullCall
  end

  def vote_oxford
    @full_call.oxford_vote += 1
    @full_call.save
    redirect_to :back, notice: 'Vote registered'
  end

  def vote_webster
    @full_call.webster_vote += 1
    @full_call.save
    redirect_to :back, notice: 'Vote registered'
  end

  def vote_johnson
    @full_call.johnson_vote += 1
    @full_call.save
    redirect_to :back, notice: 'Vote registered'
  end

  def vote_urban
    @full_call.urban_vote += 1
    @full_call.save
    redirect_to :back, notice: 'Vote registered'
  end

  private

    def set_full_call
      @full_call = FullCall.find(params[:id])
    end

    def full_call_params
      params.require(:full_call).permit(:word, :definition)
    end
end
