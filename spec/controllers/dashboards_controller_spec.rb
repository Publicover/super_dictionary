require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do

  describe "GET #index" do
    it "requires authentication" do
      get :index
      expect(response).to have_http_status(:redirect)
    end
  end

end
