class Entity < ApplicationRecord
  self.table_name = "entity"
  self.primary_key = :entity_id

  before_save :normalize_blank_values

  # Include default devise modules. Others available are:
  # :trackable and :omniauthable
  devise :confirmable, :registerable, :recoverable,
         :rememberable, :timeoutable, :lockable, :validatable
  devise :database_authenticatable, :authentication_keys => [:username]

  validates_format_of  :username, :with => /\A[a-zA-Z0-9]+\Z/
  validates_length_of  :username, :maximum => 50, :minimum => 6

  belongs_to :prefix, optional: true
  belongs_to :suffix, optional: true
  belongs_to :entity_type
  has_many :phone_numbers, dependent: :destroy

  accepts_nested_attributes_for :phone_numbers, allow_destroy: true

  protected

    def confirmation_required?
      false
    end

    def email_required?
      false
    end

    def normalize_blank_values
      attributes.each do |column, value|
        self[column].present? || self[column] = nil
      end
    end
end
