require 'spec_helper'

describe ExpensesController do
  render_views

  describe "GET '/expenses'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "should have correct title" do
      get 'index'
      response.should have_selector("title", :content => "Expenser")
    end 
  end

  describe "GET '/expenses/new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have correct title" do
      get 'new'
      response.should have_selector("title", :content => "New Expense")
    end
  end

#  describe "GET '/expenses/edit/1'" do
#    it "should be successful" do
#      get 'edit'
#      response.should be_success  
#    end
#  end
end
