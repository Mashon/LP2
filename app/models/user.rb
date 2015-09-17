class User < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of :name, maximum: 20

  validates_presence_of :email
  validates_length_of :email, within: 6..25

  validates_presence_of :pin
  validates_length_of :pin, is 4
end
