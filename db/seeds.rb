# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   
Message.delete_all
Message.create(user_id: 1,
               title: 'title01',
               message: 'message01',
               image_url: 'ruby.jpg')

Message.create(user_id: 1,
               title: 'title02',
               message: 'message02',
               image_url: 'ruby.jpg')
               
Message.create(user_id: 2,
               title: 'title03',
               message: 'message03',
               image_url: 'ruby.jpg')

User.create(id: 1,
            email: 'upartner.01@gmail.com',
            name: 'name01',
            password: '12345678')

User.create(id: 2,
            email: 'upartner.02@gmail.com',
            name: 'name02',
            password: '12345678')
            
Friend.create(user_id: 1,
              friend_id: 2)


