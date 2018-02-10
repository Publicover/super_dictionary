require 'rails_helper'

RSpec.describe "Renamed routes", :type => :routing do
  it 'gets root_path' do
    expect(:get => "/").to route_to(:controller => 'dashboards', :action => 'index')
  end

  it 'gets /signup' do
    expect(:get => 'signup').to route_to(:controller => 'users', :action => 'new')
  end

  it 'posts /signup' do
    expect(:post => 'signup').to route_to(:controller => 'users', :action => 'create')
  end

  it "gets /login" do
    expect(:get => '/login').to route_to(:controller => "sessions", :action => "new")
  end

  it "posts /login" do
    expect(:post => '/login').to route_to(:controller => "sessions", :action => "create")
  end

  it "deletes /logout" do
    expect(:delete => '/logout').to route_to(:controller => "sessions", :action => "destroy")
  end
end
