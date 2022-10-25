class CreateFixtures < ActiveRecord::Migration[7.0]
  def change
    create_table :fixtures do |t|
      t.references :home_team, null: false, foreign_key: { to_table: :teams }
      t.references :away_team, null: false, foreign_key: { to_table: :teams }
      t.date :date
      t.references :competition, null: false, foreign_key: true
      t.integer :home_score
      t.integer :away_score
      t.boolean :locked, default: false

      t.timestamps
    end
  end
end
