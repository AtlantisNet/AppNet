class CreatePaginas < ActiveRecord::Migration[5.0]
  def change
    create_table :paginas do |t|
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
