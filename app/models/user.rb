# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#
class User < ActiveRecord::Base
  email_regex = /\A^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$\z/i
  attr_accessible :name, :email
  validates :name, :presence    => true,
                   :length      => { :maximum => 50}
  validates :email, :presence   => true
  validates :email, :format     => {:with => email_regex},
                    :uniqueness => {:case_sensitive => false}
end


