class ChangeYearsActiveToBeIntegerInMusicians < ActiveRecord::Migration[7.0]
  def change
    change_column :musicians, :years_active, :integer, using: 'years_active::integer'
  end
end
