class CreateEstimates < ActiveRecord::Migration[5.2]
  def change
    create_table :estimates do |t|
      t.string :name  #名前
      t.string :kana  #ふりがな
      t.string :tel #携帯番号
      t.string :email #メールアドレス
      t.string :address #住所

      t.string :type #住居タイプ
      t.string :select #リフォーム箇所
      t.string :year #築年数
      t.string :period #施工時期
      t.string :price #予算

      t.references :user
      t.timestamps
    end
  end
end
