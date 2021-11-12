require "spec_helper"

RSpec.describe ApplicationController do
  before(:each) do
    @application = applications(:one)
  end

  context "Get Home Url" do
    it "should get index" do
      get applications_url, as: :json
      assert_response :success
    end

    it "should create application" do
      assert_difference('Application.count') do
        post applications_url, params: { application: {  } }, as: :json
      end

      assert_response 201
    end

    it "should show application" do
      get application_url(@application), as: :json
      assert_response :success
    end

    it "should update application" do
      patch application_url(@application), params: { application: {  } }, as: :json
      assert_response 200
    end

    it "should destroy application" do
      assert_difference('Application.count', -1) do
        delete application_url(@application), as: :json
      end

      assert_response 204
    end
  end
end
