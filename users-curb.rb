require 'pry'
require 'curb'
require 'colorize'
require 'json'

BASE_URL = "http://devpoint-ajax-example-server.herokuapp.com/api/v1"


# returns array of users (iterate arrays)

def all_users(users)
  users.each do |user|
    puts user["id"]
    puts user["first_name"]
    puts user["last_name"]
    puts user["phone_number"]
  end
end

def display_user
  puts "Type the Id of the user to display"
  id = gets.strip.to_i
  http = Curl.get("#{BASE_URL}/users/#{id}")
  user_response = JSON.parse(http.body_str)
  if (user_response.has_key?("user"))
    user = user_response["user"]
    puts user["first_name"]
    puts user["last_name"]
    puts user["phone_number"]
    puts "------"
  elsif (user_response.has_key?('message'))
  else
  end

  end 
end
# 10968

def get_users_data
    http = Curl.get("#{BASE_URL}/users")
    JSON.parse(http.body_str)["users"]
end

def create_user
  print "Enter first name: "
  first = gets.strip
  print "Enter last name: "
  last = gets.strip
  print "Enter phone number: "
  phone = gets.strip
  Curl.post("#{BASE_URL}/users", {"first_name" => first, "last_name"] => last, "phone_number" => phone})
end

def menu
  option = 0
  while option != 7
    puts """--- Users API Menu ---
1) All Users
2) Single User
3) Create User
4) Update User
5) Delete User
6) User Count
7) Quit"""
    option = gets.strip.to_i
    case option
      when 1
        users = get_users_data
        all_users(users)
      when 2
        display_user
      when 3
        create_user
      when 4
        puts "4"
      when 5
        puts "5"
      when 6
        puts "6"
      when 7
        puts "Have a nice day!"
      else
        puts "Invalid option." 
    end
  end
end




# main method
menu
# display_all(users)