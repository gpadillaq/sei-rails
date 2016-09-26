class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_validation :random_password

  def display_name
    self.nombre
  end

  def random_password
    self.password = self.password_confirmation = SecureRandom.hex(8)
  end
end
