class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar, :string, default: 'avatar_placeholder.png'
  end
end
