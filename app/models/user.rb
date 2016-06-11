class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :registerable

  validates :first_name, :last_name, length: { in: 2..30 }, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
