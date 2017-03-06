class HealthRecord < ApplicationRecord
  include Filterable
  scope :start_date, -> (timestamp) { where("timestamp >= '#{timestamp}'") }
  scope :end_date, -> (timestamp) { where("timestamp <= '#{timestamp}'") }
  scope :user_id, -> (user_id) { where user_id: user_id }
  scope :min_heart_rate, -> (hrbpm) { where("hrbpm >= #{hrbpm}") }
  scope :max_heart_rate, -> (hrbpm) { where("hrbpm <= #{hrbpm}") }
  scope :min_steps, -> (steps) { where("steps >= #{steps}") }
  scope :max_steps, -> (steps) { where("steps <= #{steps}") }

  belongs_to :user
  validates :timestamp,
            presence: true,
            :allow_nil => false,
            :allow_blank => false

  def self.batch_create(post_content, current_user)
    begin
      HealthRecord.transaction do
        JSON.parse(post_content).each do |healthrecord_hash|
          @record = HealthRecord.where(:timestamp => healthrecord_hash['timestamp'], :user => current_user).first

          if !@record.nil?
            @record.update!(healthrecord_hash)
          else
            @record = HealthRecord.new(healthrecord_hash)
            @record.user = current_user
            @record.save!
          end
        end
        true
      end
    rescue
      false
    end
  end
end
