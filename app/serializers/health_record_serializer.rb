class HealthRecordSerializer < ActiveModel::Serializer
  attributes :timestamp, :steps, :yaw, :pitch, :vmc, :light, :activity, :hrbpm, :created_at, :updated_at
end
