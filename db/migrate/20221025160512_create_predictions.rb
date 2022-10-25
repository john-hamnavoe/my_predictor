class CreatePredictions < ActiveRecord::Migration[7.0]
  def change
    create_table :predictions do |t|
      t.references :competition_entry, null: false, foreign_key: true
      t.references :fixture, null: false, foreign_key: true
      t.integer :home_score
      t.integer :away_score
      t.boolean :correct, default: false
      t.integer :goal_difference, default: 0
      t.integer :points, default: 0

      t.timestamps
    end
  end
end
