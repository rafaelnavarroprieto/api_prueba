class Person < ApplicationRecord

  ADULT_AGE = 18

  has_many :notifications_created, :class_name => "Notification", :foreign_key => :sender_id
  has_many :notifications_received, :class_name => "Notification", :foreign_key => :recipient_id

  validates :name, presence: true
  validates :birthday, presence: true

  scope :adult, -> { where("cast(strftime('%Y', birthday) as int) > ?", adult_year) }

  def self.adult_year
    DateTime.now.year - ADULT_AGE
  end
end
