class User < ApplicationRecord
  belongs_to :role
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable, :trackable
  def admin?
    role.role == 'admin'
  end
end
