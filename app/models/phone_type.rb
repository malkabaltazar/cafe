class PhoneType < ApplicationRecord
  self.table_name = "phone_type"
  self.primary_key = :phone_type_id

  has_many :phone_numbers
end
