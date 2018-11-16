class Prefix < ApplicationRecord
  self.table_name = "prefix"
  self.primary_key = :prefix_id

  has_many :entities
end
