class User < ActiveRecord::Base
  validates :rut, rut: true
end