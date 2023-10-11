class CreateMusicians < ActiveRecord::Migration[7.0]
  def change
    create_table :musicians do |t|
      t.string :name
      t.boolean :on_leave
      t.string :instrument
      t.integer :position
      t.string :years_active
      t.string :integer

      t.timestamps
    end
  end
end
