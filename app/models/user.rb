class User < ActiveRecord::Base

  has_many :lawyers
  has_secure_password

end
