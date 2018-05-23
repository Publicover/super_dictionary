class FullCallsController < ApplicationController
  before_action :logged_in?,
    only: [:show, :index, :update, :vote_oxford, :vote_webster, :vote_johnson, :vote_urban]
  before_action :set_full_call,
    only: [:show, :update, :vote_oxford, :vote_webster, :vote_johnson, :vote_urban]

  def index
    # @full_calls = FullCall.all
    @full_calls = FullCall.select(:word).map(&:word).uniq
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
    @full_call = FullCall.where(word: full_call_params[:word]).first_or_create do |call|
      call.oxford_def = OxfordCall.oxford_api(call.word)
      call.webster_def = WebsterCall.webster_api(call.word)
      call.johnson_def = JohnsonCall.johnson_api(call.word)
      call.urban_def = UrbanCall.urban_api(call.word)
      # call.lookup_count += 1
    end

    if @full_call.save
      redirect_to @full_call
    else
      render 'new'
    end
  end

  def update
    # @full_call = FullCall.find(params[:id])
    # if @full_call.save
    #   redirect_to @full_call
    # end
  end

  def destroy
    # @full_call = FullCall
  end

  def vote_oxford
    @full_call.oxford_vote += 1
    @full_call.save
    # respond_to do |format|
    #   format.html {redirect_to :back}
    #   format.js {}
    # end
    # redirect_to :back, notice: 'Vote registered'
    unless !browser.device.mobile? && @full_call.save
      render 'full_calls/_mobile'
    end
  end

  def vote_webster
    @full_call.webster_vote += 1
    @full_call.save
    unless !browser.device.mobile? && @full_call.save
      render 'full_calls/_mobile'
    end

    # redirect_to :back, notice: 'Vote registered'
  end

  def vote_johnson
    @full_call.johnson_vote += 1
    @full_call.save
    # redirect_to :back, notice: 'Vote registered'
    unless !browser.device.mobile? && @full_call.save
      render 'full_calls/_mobile'
    end
  end

  def vote_urban
    @full_call.urban_vote += 1
    @full_call.save
    # redirect_to :back, notice: 'Vote registered'
    unless !browser.device.mobile? && @full_call.save
      render 'full_calls/_mobile'
    end
  end

  private

    def set_full_call
      @full_call = FullCall.find(params[:id])
    end

    def full_call_params
      params.require(:full_call).permit(:word, :definition)
    end
end
