class Package < ApplicationRecord
    belongs_to :sender_agent, class_name: "User", optional: true
    belongs_to :receiver_agent, class_name: "User", optional: true
  
    enum status: {
      pending_unpaid: "pending_unpaid",
      pending: "pending",
      in_transit: "in_transit",
      delivered: "delivered",
      cancelled: "cancelled"
    }
  
    validates :recipient_name, :recipient_phone, :delivery_type, presence: true
  end
  