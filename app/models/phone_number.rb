class PhoneNumber < ApplicationRecord
  self.table_name = "phone_number"
  self.primary_key = :phone_number_id

  before_validation :strip_non_numbers
  after_save :delete_blanks

  with_options unless: :all_blank do |phone_number|
    phone_number.validates_format_of  :phone_number, :with => /\A[0-9]+\Z/
    phone_number.validates_length_of  :phone_number, :is => 10
    phone_number.validates_presence_of  :phone_type_id
  end

  has_one :phone_type
  belongs_to :entity

  protected

    def strip_non_numbers
      self.phone_number.gsub!(/[^0-9]/, '') if self.phone_number =~ /\d/
    end

    def all_blank
      true if self.phone_number.blank? && self.phone_type_id.blank?
    end

    def delete_blanks
      self.destroy if self.phone_type_id.blank?
    end
end
