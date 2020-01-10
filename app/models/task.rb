class Task < ApplicationRecord
  belongs_to :user
  
  validates :task_title, presence: true, length: {maximum: 20}
  validates :details, presence: true, length: {maximum: 50}
end
