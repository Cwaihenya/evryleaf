# README

Model name
Name : Task
Name : User
Name : Labels

Tasks Tables
t.string "title"
t.string "content"
t.string "status"
t.string "priority"
t.date "deadline"

t.string :Name
t.string :Email
t.string :Password
t.string :Password_confirmation

$ heroku login
$ heroku create

Compile the app and push it on heroku
$ rails assets:precompile RAILS_ENV=production
$ git add -A
$ git commit -m "message"
$  git push heroku step2:master
