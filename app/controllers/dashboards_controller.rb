class DashboardsController < ApplicationController
  before_action :logged_in?

  def index
    @full_call = FullCall.new
    @oxford_votes = FullCall.sum(:oxford_vote)
    @webster_votes = FullCall.sum(:webster_vote)
    @johnson_votes = FullCall.sum(:johnson_vote)
    @urban_votes = FullCall.sum(:urban_vote)
    # @votes = [{ dictionary: 'Oxford', user_votes: @oxford_votes },
    #           { dictionary: 'Webster', user_votes: @owebster_votes },
    #           { dictionary: 'Johnson', user_votes: @johnson_votes },
    #           { dictionary: 'Urban', user_votes: @urban_votes }]
    # @highest_votes = @votes.max_by { |key| key[:user_votes] }
    @all_votes = { Oxford: @oxford_votes, Webster: @webster_votes,
                   Johnson: @johnson_votes, Urban: @urban_votes }
    @best_dictionary_votes = @all_votes.values.max
    @best_dictionary = @all_votes.key(@best_dictionary_votes)
  end
end
