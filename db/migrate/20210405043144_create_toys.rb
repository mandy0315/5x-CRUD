class CreateToys < ActiveRecord::Migration[6.1]
  def change
    create_table :toys do |t|
      t.string :name
      t.datetime :time
      t.integer :number
      t.text :description

      t.timestamps
    end
  end
end
