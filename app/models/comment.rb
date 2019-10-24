class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :workshop, class_name: "Workshop", optional: true
end
