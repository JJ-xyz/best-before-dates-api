class User < ApplicationRecord
  belongs_to :household
  has_secure_password
end
