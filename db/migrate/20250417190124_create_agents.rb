class CreateAgents < ActiveRecord::Migration[7.1]
  def change
    create_table :agents do |t|
      t.string :name
      t.string :phone
      t.string :station
      t.string :zone

      t.timestamps
    end
  end
end
