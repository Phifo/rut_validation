class User < ActiveRecord::Base
  attr_accessible :rut

  validates :rut, rut: true
end