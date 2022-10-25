class CreateCompetitionEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :competition_entries do |t|
      t.references :competition, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :winner, null: true, foreign_key: { to_table: :teams }
      t.references :runner_up, null: true, foreign_key: { to_table: :teams }
      t.integer :points, null: false, default: 0
      t.integer :correct_scores, null: false, default: 0
      t.integer :goal_difference, null: false, default: 0

      t.timestamps

      t.index [:competition_id, :user_id], unique: true
    end
  end
end
