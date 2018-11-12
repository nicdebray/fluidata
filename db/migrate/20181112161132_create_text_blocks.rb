class CreateTextBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :text_blocks do |t|
      t.references :report, foreign_key: true
      t.text :content
      t.integer :order

      t.timestamps
    end
  end
end
