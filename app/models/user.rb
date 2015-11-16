class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, on: :create
  validates :email, uniqueness: true, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
end
