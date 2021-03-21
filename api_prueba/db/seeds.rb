# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#----Person Examples-------

Person.create(name: "person1", birthday: DateTime.new(2001,2,3.5))
Person.create(name: "person2", birthday: DateTime.new(2002,2,3.5))
Person.create(name: "person3", birthday: DateTime.new(2003,2,3.5))
Person.create(name: "person4", birthday: DateTime.new(2004,2,3.5))
Person.create(name: "person5", birthday: DateTime.new(2005,2,3.5))
Person.create(name: "person6", birthday: DateTime.new(2006,2,3.5))

#----Notification Examples-------

Notification.create(sender_id: Person.first.id, recipient_id: Person.last.id,
subject: "lorem", content: "lorem ipsum dolo")
Notification.create(sender_id: Person.last.id, recipient_id: Person.first.id,
subject: "lorem 1", content: "lorem ipsum dolo 1")
Notification.create(sender_id: Person.first.id, recipient_id: Person.last.id,
subject: "lorem 2", content: "lorem ipsum dolo 2", old_notification_id: 1)

#----Assets Examples-------

5.times do |_x|
  Asset.create!(notification_id: Notification.first.id)
end 