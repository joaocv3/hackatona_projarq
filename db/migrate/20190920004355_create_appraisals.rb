class CreateAppraisals < ActiveRecord::Migration[5.2]
  def change
    create_table :appraisals do |t|
      t.string :name
      t.references :team, foreign_key: true
      t.references :appraiser, foreign_key: true
      t.integer :working_software
      t.integer :process
      t.integer :pitch
      t.integer :inovation
      t.integer :team_formation

      t.timestamps
    end
  end
end
