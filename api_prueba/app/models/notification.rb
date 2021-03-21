class Notification < ApplicationRecord

  has_many :assets

  belongs_to :old_notification, optional: true, class_name: "Notification" , foreign_key: :old_notification_id

  belongs_to :sender, class_name: "Person" , foreign_key: :sender_id
  belongs_to :recipient, class_name: "Person" , foreign_key: :recipient_id

  validates :subject, presence: true
  validates :content, presence: true

  def total_assets
    assets.count
  end
  
end
