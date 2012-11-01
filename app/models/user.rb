class User < ActiveRecord::Base
  include Gravtastic
  gravtastic

  has_many :orders
  has_many :items, through: :orders
end