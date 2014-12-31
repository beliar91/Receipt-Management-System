# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


complaint_statuses = ComplaintStatus.create( [{name: 'Oczekuje na zaakceptowanie'}, {name: 'Odrzucona przez administratora'},
                                              {name: 'W toku (zaakceptowana przez administratora)'},
                                              {name: 'Uznana'},  {name: 'Nieuznana'}   ] )