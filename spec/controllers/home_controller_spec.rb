require "spec_helper"

RSpec.describe HomeController, :type => :controller do
  before(:each) do
    @home = homes(:one)
  end

  context "Get Home Url" do
    it "should get index" do
      get home_url, as: :json
      assert_response :success
    end

    it "should create home" do
      assert_difference('home.count') do
        post homes_url, params: { home: {  } }, as: :json
      end

      assert_response 201
    end

    it "should show home" do
      get home_url(@home), as: :json
      assert_response :success
    end

    it "should update home" do
      patch home_url(@home), params: { home: {  } }, as: :json
      assert_response 200
    end

    it "should destroy home" do
      assert_difference('home.count', -1) do
        delete home_url(@home), as: :json
      end

      assert_response 204
    end
  end
end
