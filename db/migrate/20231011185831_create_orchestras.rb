class CreateOrchestras < ActiveRecord::Migration[7.0]
  def change
    create_table :orchestras do |t|
      t.string :name
      t.boolean :active
      t.string :city
      t.integer :total_conductors

      t.timestamps
    end
  end
end
