class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  has_secure_password

  field :email, type: String
  field :password_digest, type: String

  has_one :avatar, class_name: 'Image'
  has_many :images
  has_many :posts
end
