class User < ActiveRecord::Base
  ROLES = {0 => :user}
  attr_reader :role
    def initialize(role_id = 0)
      @role = ROLES[0]
    end

    def role?(role_name)
      role == role_name
    end
    
  has_secure_password
  has_many :info
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :user, presence: true, uniqueness: {case_sensitive: false}, length:{minimum: 3, maximum: 25}
  validates :email, presence: true, length: {maximum: 105}, uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}
  before_save { self.email = email.downcase }
end
