require "sinatra"

get("/howdy") do
  return "Hello, world!"
end

get("/zebra") do
  return "We must add a route for every path we want to support"
end

get("/") do
  lucky_num = rand(100)
  return "Your lucky number for today is " + lucky_num.to_s
end
