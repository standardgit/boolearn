class User < ApplicationRecord
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable

  rolify

  def to_s
    email
  end

  def username
    if email.present?
      self.email.split(/@/).first
    end
  end

  has_many :courses
end
