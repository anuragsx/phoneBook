class Contact < ApplicationRecord
	has_many :phone_numbers, dependent: :destroy
	has_many :postal_addresses, dependent: :destroy

	accepts_nested_attributes_for :phone_numbers, :reject_if => lambda { |a| a[:phone_no].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :postal_addresses, :reject_if => lambda { |a| a[:address].blank? }, :allow_destroy => true


	validates :name, presence: true
	validates :name, uniqueness: true
end
