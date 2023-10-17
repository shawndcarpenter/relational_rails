class RemoveIntegerFromMusicians < ActiveRecord::Migration[7.0]
  def change
    remove_column :musicians, :integer, :string
  end
end
