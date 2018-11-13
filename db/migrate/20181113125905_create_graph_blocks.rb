class CreateGraphBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :graph_blocks do |t|
      t.string :graph_type
      t.date :start_date
      t.date :end_date
      t.integer :order
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
