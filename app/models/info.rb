class Info < ActiveRecord::Base
  belongs_to :user
  validates :site, presence: true
  validates :username, presence: true, length: {minimum: 4, maximum: 50}
  validates :password, presence: true, length: {minimum: 4}
  validates :signature, presence: true, length: {minimum: 3}
  validates :user_id, presence: true
end
