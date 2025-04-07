class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :username, presence: true, uniqueness: true

  enum role: {
    admin: 0,
    agent: 1,
    rider: 2,
    warehouse: 3,
    client: 4
  }


  before_validation :assign_unique_username, on: :create

  private

  def assign_unique_username
    return if username.blank?

    base = username.parameterize
    candidate = base
    attempts = 0

    while User.exists?(username: candidate) && attempts < 20
      suffix = "%04d" % rand(0..9999)  # 0000 to 9999
      candidate = "#{base}#{suffix}"
      attempts += 1
    end

    self.username = candidate
  end
end
