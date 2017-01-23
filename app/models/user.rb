class User < ActiveRecord::Base
  has_many :product
  has_many :comment

  validates :first_name, :last_name,
            presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
                              message: "should be in right format" }
  validates :email, uniqueness: true

  has_secure_password
end
