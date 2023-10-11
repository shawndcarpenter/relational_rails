class AddOrchestraToMusicians < ActiveRecord::Migration[7.0]
  def change
    add_reference :musicians, :orchestra, null: false, foreign_key: true
  end
end
