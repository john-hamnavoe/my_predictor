class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :headline
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.references :competition, null: true, foreign_key: true

      t.timestamps
    end
  end
end
