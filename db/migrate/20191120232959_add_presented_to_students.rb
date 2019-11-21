class AddPresentedToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :presented, :boolean
  end
end
