require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/howdy") do
  return "Hello, world!"
end

get("/zebra") do
  return "We must add a route for every path we want to support"
end

get("/giraffe") do
  return "Hopefully this shows up without having to restart the server"
end

get("/") do
  erb(:elephant)
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
  #this makes it an instance variable rather than a local variable
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  erb(:two_six, { :layout => :wrapper })
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  erb(:two_ten, { :layout => :wrapper })
end

get("/dice/1/20") do
  die_roll = rand(1..20)

  @outcome = "You rolled a #{die_roll}."
  erb(:one_twenty, { :layout => :wrapper })
end

get("/dice/5/4") do
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die =rand(1..4)
  fifth_die = rand(1..4)

  sum = first_die + second_die + third_die + fourth_die + fifth_die

  @outcome = "You rolled a #{first_die}, a #{second_die}, a #{third_die}, a #{fourth_die}, and a #{fifth_die} for a total of #{sum}."

  erb(:five_four, { :layout => :wrapper })
end
