class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :leaves, :dependent => :destroy, :class_name => "Leave"
  has_many :number_of_leaves_per_types, :class_name => "NumberOfLeavesPerType"
end
