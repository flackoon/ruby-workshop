class Workshop < ApplicationRecord
	has_and_belongs_to_many :users
  has_and_belongs_to_many :comments
	
	validates :title, presence: true,
										length: { minimum: 5 }
end
