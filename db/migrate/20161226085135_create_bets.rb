class CreateBets < ActiveRecord::Migration[5.0]
  def change
    create_table :bets do |t|
      t.references :user, foreign_key: true
      t.references :pagina, foreign_key: true
      t.integer :time1
      t.integer :time2
      t.decimal :valor

      t.timestamps
    end
  end
end
