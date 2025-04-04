class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {
    admin: 0,
    agent: 1,
    rider: 2,
    warehouse: 3,
    client: 4
  }
end
