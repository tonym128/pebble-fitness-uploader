class HealthRecord < ApplicationRecord
  belongs_to :user
  validates :timestamp,
            presence: true,
            :allow_nil => false,
            :allow_blank => false

  def self.batch_create(post_content, current_user)
    begin
      HealthRecord.transaction do
        JSON.parse(post_content).each do |healthrecord_hash|
          @record = HealthRecord.find_by_timestamp_and_user_id(healthrecord_hash['timestamp'], current_user.id)
          if !@record.nil?
            pp 'Update'
            pp @record
            @record.update!(healthrecord_hash)
          else
            @record = HealthRecord.new(healthrecord_hash)
            @record.user = current_user
            @record.save!
          end
        end
        true
      end
    rescue => exception
      pp exception
      false
    end
  end
end
