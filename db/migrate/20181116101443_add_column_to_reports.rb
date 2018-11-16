class AddColumnToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :starred,:boolean, default: false, null: false
  end
end
