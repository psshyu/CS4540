# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.first_or_create(
  first_name: 'David',
  last_name: 'Bean',
  email: 'bean@cs.utah.edu',
  admin: true,
  password: 'foobar',
  password_confirmation: 'foobar'
)

u.alerts.create(status: :generated, delivered_at: Time.now - 5.minutes)
u.alerts.create(status: :delivered, delivered_at: Time.now - 5.minutes)
u.alerts.create(status: :delivered, delivered_at: Time.now - 15.minutes)
u.alerts.create(status: :delivered, delivered_at: Time.now - 55.minutes)
u.alerts.create(status: :delivered, delivered_at: Time.now - 75.minutes)
u.alerts.create(status: :delivered, delivered_at: Time.now - 85.minutes)
u.alerts.create(status: :delivered, delivered_at: Time.now - 95.minutes)
u.alerts.create(status: :delivered, delivered_at: Time.now - 105.minutes)
u.alerts.create(status: :delivered, delivered_at: Time.now - 115.minutes)

Audit.create(category: :auto_search, title: 'Scheduled Youtube search',  severity: :low)
Audit.create(category: :auto_search, title: 'Scheduled Youtube search',  severity: :low)
Audit.create(category: :auto_search, title: 'Scheduled Youtube search',  severity: :low)
Audit.create(category: :auto_search, title: 'Scheduled Youtube search',  severity: :low)
Audit.create(category: :auto_search, title: 'Scheduled Youtube search',  severity: :low)
Audit.create(category: :auto_search, title: 'Scheduled Youtube search',  severity: :low)
Audit.create(category: :auto_search, title: 'Scheduled Youtube search',  severity: :low)
