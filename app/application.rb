
class Application

# Your application should only accept 
# the /items/<ITEM NAME> route. Everything else should 404
# If a user requests /items/<Item Name> 
# it should return the price of that item
# IF a user requests an item 
# that you dont have, then return a 400 and an error message

def call(env) # ! this code runs whenever a request is received
resp = Rack::Response.new
req = Rack::Request.new(env) # this holds all the request info

# ! As we go along the path i keep checking this informaion
if req.path.match(/items/) # ? we filter for a specific path
    item_name = req.path.split("/items/").last 
    if item = @@items.find{|x| x.name == item_name}
       
     resp.write item.price
    else
     resp.write "Item not found"
     resp.status = 400
    end
 else
   resp.write "Route not found"
   resp.status = 404
 end
 resp.finish
end

 
 

# ttps://github.com/search?q=apples
# section after ? is called the GET parametrs 
# and the ycome in key value paris 
# rack provides a mechanism to prse the GET params 
# nd return them to us in aa standard hash 

# class Application
 
#     @@items = ["Apples","Carrots","Pears"]
   
#     def call(env)
#       resp = Rack::Response.new
#       req = Rack::Request.new(env)
   
#       if req.path.match(/items/)
#         @@items.each do |item|
#           resp.write "#{item}\n"
#         end
#       elsif req.path.match(/search/)
   
#         search_term = req.params["q"]
   
#         if @@items.include?(search_term)
#           resp.write "#{search_term} is one of our items"
#         else
#           resp.write "Couldn't find #{search_term}"
#         end
   
#       else
#         resp.write "Path Not Found"
#       end
   
#       resp.finish
#     end
#   end
end