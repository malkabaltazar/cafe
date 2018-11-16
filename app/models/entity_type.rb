class EntityType < ApplicationRecord
  self.table_name = "entity_type"
  self.primary_key = :entity_type_id

  has_many :entities
end
