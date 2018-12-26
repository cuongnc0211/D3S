class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ADMIN_CREATE_ATTRIBUTE = [:email, :password, :password_confirmation, :role]
  UPDATE_ATTRIBUTE = [:name, :role]

  enum role: {admin: 0, mod: 1}

  attr_accessor :admin_create_user
end
