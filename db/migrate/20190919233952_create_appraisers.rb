class CreateAppraisers < ActiveRecord::Migration[5.2]
  def change
    create_table :appraisers do |t|
      t.string :name

      t.timestamps
    end
  end
end
