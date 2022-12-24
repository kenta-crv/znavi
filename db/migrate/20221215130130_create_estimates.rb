class CreateEstimates < ActiveRecord::Migration[5.2]
  def change
    create_table :estimates do |t|
      t.string :name  #名前
      t.string :kana  #ふりがな
      t.string :tel #携帯番号
      t.string :email #メールアドレス
      t.string :postnumber #郵便番号
      t.string :address #住所

      t.string :car #車種
      t.string :year #年式
      t.string :mile #毎月の走行距離

      t.string :bank #振込先
      t.string :store #支店
      t.string :number #口座番号
      t.string :bank_name #口座名義

      t.references :user
      t.timestamps
    end
  end
end
