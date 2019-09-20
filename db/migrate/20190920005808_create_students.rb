class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.references :team, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
