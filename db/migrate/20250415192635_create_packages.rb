class CreatePackages < ActiveRecord::Migration[7.1]
  def change
    create_table :packages do |t|
      t.string :recipient_name
      t.string :recipient_phone
      t.integer :sender_agent_id
      t.string :delivery_type
      t.text :location
      t.integer :receiver_agent_id
      t.string :courier_service
      t.string :destination
      t.string :status

      t.timestamps
    end
  end
end
