class Client < ApplicationRecord
  validates :first_name, :last_name, :phone, presence: true
  validates :email, format: { with: /@/ }, allow_blank: true
  validates :first_name, :last_name, :phone, length: {maximum: 50, allow_empty: true}
end
