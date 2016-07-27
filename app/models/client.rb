class Client < ApplicationRecord
  validates :first_name, :last_name, :phone, presence: true
  validates_format_of :email, with: /@/
  validates :first_name, :last_name, :phone, length: {maximum: 50, allow_empty: true}
end
