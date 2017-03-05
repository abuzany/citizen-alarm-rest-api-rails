# This method represents an Alter which is reported by the userss throught
# citizen alarm app.
class Alert < ApplicationRecord
  belongs_to :user
  belongs_to :alert_type

   validates :user_id,
             :alert_type_id,
             :latitude,
             :longitude,
              presence: true

  validates :description,
            presence: true,
            allow_blank: false

  validates :description, length: { maximum: 140 }

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  # This scope returns the alerts created today.
  scope :created_today, -> {
    where(
      created_at: DateTime.now.beginning_of_day..DateTime.now.end_of_day
    )
  }
  # This scope returns the alerts created this month.
  scope :created_monthly, -> {
    where(
      created_at: DateTime.now.beginning_of_month..DateTime.now.end_of_month
    )
  }
  # This scope returns the alerts created this week..
  scope :created_weekly, -> {
    where(
      created_at: DateTime.now.beginning_of_week..DateTime.now.end_of_week
    )
  }
end
