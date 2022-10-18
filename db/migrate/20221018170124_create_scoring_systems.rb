class CreateScoringSystems < ActiveRecord::Migration[7.0]
  def change
    create_table :scoring_systems do |t|
      t.string :name
      t.integer :range

      t.timestamps
    end
  end
end
