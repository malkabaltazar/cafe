class Suffix < ApplicationRecord
  self.table_name = "suffix"
  self.primary_key = :suffix_id

  has_many :entities
end
