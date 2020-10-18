class CreateUserRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :user_rooms do |t|
      # reference型メリット
      # ・userではなくuser_idというカラムを作ってくれる
      # ・インデックスを自動で貼ってくレル
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
