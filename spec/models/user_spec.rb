# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#

require 'rails_helper'


RSpec.describe User do

  describe 'User Validations', type: :model do

    before do
      @user = FactoryGirl.create(:user)
    end

    it "should be valid" do
      expect(@user).to be_valid
    end

    it "name should be present" do
      @user.name = "  "
      expect(@user).not_to be_valid
    end


    it "email should be present" do
      @user.email = "   "
      expect(@user).not_to be_valid
    end

    it "name should not be too long" do
      @user.name = "a" * 51
      expect(@user).not_to be_valid
    end

    it "email should not be too long" do
      @user.email = "a" * 244 + "@example.com"
      expect(@user).not_to be_valid
    end

    it "email validation should accept valid addresses" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid, "#{valid_address.inspect} should be valid"
      end
    end


    it "invalid email should be rejected" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]

      invalid_addresses.each do |invalid|
        @user.email = invalid
        expect(@user).not_to be_valid, "#{invalid.inspect} should be invalid"
      end
    end

    it "email addresses should be unique" do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save
      expect(duplicate_user).not_to be_valid
    end

    it "password should have a minimum length" do
      @user.password = @user.password_confirmation = "a" * 5
      expect(@user).not_to be_valid
    end


  end

  describe 'User Controller', type: :request do

    before do
      @user = FactoryGirl.create(:user)
    end

    it "should redirect show when not logged in" do
      get 'show', id: @user
      expect(flash[:danger]).to be_valid
      expect(response).to redirect_to(login_url)
    end

  end





  describe 'quiz attempts' do
    before do
      @quiz = FactoryGirl.create(:quiz)
      @user = FactoryGirl.create(:user)
      @entry1 = FactoryGirl.create(:entry, quiz: @quiz, user: @user)
      @entry2 = FactoryGirl.create(:entry, quiz: @quiz, user: @user)

    end

    it 'should return a map with quiz names and attempts' do
        attempts = {Quiz.name => Entry.count}

        expect(attempts).to have_key(Quiz.name)
        expect(attempts).to have_value(2)
    end

  end


end

