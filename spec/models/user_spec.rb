require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(
      nickname:    "Yamada Taro",
      email:   "taro@example.com",
    )
  end
    # name、user_id、emailがあれば有効な状態であること
    it "is valid with a name, user_id, email" do
      user = User.new(
        nickname:    "Sato Taro",
        email:   "sato@example.com",
      )
      expect(user).to be_valid
    end
  
    # nicknameがなければ無効な状態であること（nicknameは必須項目）
    it "is invalid without a nickname" do
      user = User.new(nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
  
    # メールアドレスがなければ無効な状態であること（emailは必須項目）
    it "is invalid without an email address" do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

end