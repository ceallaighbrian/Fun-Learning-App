# require 'test_helper'
#
# class UsersControllerTest < ActionController::TestCase
#   test "should get new" do
#     get :new
#     assert_response :success
#   end
#
# end

require 'rails_helper'


RSpec.describe User, type: :request do


describe 'User Controller' do

  before do
    @user = FactoryGirl.create(:user)
    @other_user = FactoryGirl.create(:user)

  end

  it "should redirect show when not logged in" do
    get user_path(@user)
    expect(flash[:danger]).to be_present
    expect(response).to redirect_to(login_url)
  end

  it "should redirect show when logged in as wrong user" do
    log_in_as(@other_user)
    get user_path(@user)
    expect(response).to redirect_to(root_path)
  end

  end
end

