class CreateCompetitions < ActiveRecord::Migration[7.0]
  def change
    create_table :competitions do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.references :team_category, null: false, foreign_key: true
      t.references :scoring_system, null: false, foreign_key: true
      t.boolean :public, default: false
      t.boolean :active, default: true
      t.boolean :prizes, default: false

      t.timestamps
    end
  end
end
