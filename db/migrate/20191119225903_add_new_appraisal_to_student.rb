class AddNewAppraisalToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :new_appraisal, :boolean
  end
end
