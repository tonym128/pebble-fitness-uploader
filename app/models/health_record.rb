class HealthRecord < ApplicationRecord
  belongs_to :user
  validates :timestamp,  presence: true, :allow_nil => false, :allow_blank => false
end
