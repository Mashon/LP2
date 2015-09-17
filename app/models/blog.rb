class Blog < ActiveRecord::Base
  validates_presence_of :title, :body
  validates_length_of :title, minimum: 4
  validates_length_of :body, minimum: 160

end
