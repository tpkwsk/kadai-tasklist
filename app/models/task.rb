class Task < ApplicationRecord
  validates :status, presence: true, length: { maximum: 11 }
end
