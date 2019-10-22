class Comment < ApplicationRecord
	belongs_to :workshops
	belongs_to :users
end
