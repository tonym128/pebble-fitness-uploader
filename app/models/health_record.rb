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
