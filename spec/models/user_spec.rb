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


RSpec.describe Entry, type: :model do

  describe 'User Validations' do

    def before
      @user = User.new(name: "Example Example", email: "user@example.com",
                       password: "foobar", password_confirmation: "foobar")
    end

    it "should be valid" do
      expect(@user).to be_valid
    end

    it "name should be present" do
      @user.name = "  "
      assert_not @user.valid?
    end

    test "email should be present" do
      @user.email = "   "
      assert_not @user.valid?
    end

    test "name should not be too long" do
      @user.name = "a" * 51
      assert_not @user.valid?
    end

    test "email should not be too long" do
      @user.email = "a" * 244 + "@example.com"
      assert_not @user.valid?
    end

    test "email validation should accept valid addresses" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        assert @user.valid?, "#{valid_address.inspect} should be valid"
      end
    end

    test "invalid email should be rejected" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]

      invalid_addresses.each do |invalid|
        @user.email = invalid
        assert_not @user.valid? "#{invalid.inspect} should be invalid"
      end
    end

    test "email addresses should be unique" do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save
      assert_not duplicate_user.valid?
    end

    test "password should have a minimum length" do
      @user.password = @user.password_confirmation = "a" * 5
      assert_not @user.valid?
    end


  end

  describe 'quiz attempts' do
    before do

    end

    it 'should return a map with quiz names and attempts' do

    end

  end



end
