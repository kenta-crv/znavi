class Estimate < ApplicationRecord
  attr_accessor :user_name
  attr_accessor :user_password
  belongs_to :user, optional: true

  validates :name, {presence: true}  #名前
  validates :kana, {presence: true}  #ふりがな
  validates :tel, {presence: true} #電話番号
  validates :email, {presence: true} #メールアドレス
  validates :postnumber, {presence: true} #郵便番号
  validates :address, {presence: true} #住所
end
