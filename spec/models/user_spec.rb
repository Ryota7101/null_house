require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  
  #名、メール、パスワードがあれば有効な状態であること
  it "is valid with a name, email, and password" do
    user = User.new(
      name: "Suzuki",
      email: "test@example.com",
      password: "hogehoge",
      )
      expect(user).to be_valid
  end
    
    
  # 名がなければ無効な状態であること
  # model側でvalidates:name,presence:trueを削除すると、このテストは失敗する
  it "is invalid without a name" do
    user = User.new(name: nil)
    user.valid?
    # ユーザーのname属性にエラーメッセージが付いていることを期待(expect)する
    expect(user.errors[:name]).to include("can't be blank")
  end
  
  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address"  do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
  
  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    User.create(
      name: "Suzuki",
      email: "test@example.com",
      password: "hogehoge",
      )
    
    user = User.new(
      name: "Ryota",
      email: "test@example.com", #上記のSuzukiで作成したemailと同じ
      password: "hogehoge",
      )
    
    user.valid?
    
    expect(user.errors[:email]).to include("has already been taken")
  
  end
  
end
