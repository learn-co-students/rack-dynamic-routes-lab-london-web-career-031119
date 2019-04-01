require_relative './item.rb'
require 'pry'

class Application

  @@items

    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

      if req.path.match(/items/)
        item_name = req.path.split("/items/").last
        item = @@items.find{|i| i.name == item_name}
          if item
            resp.write item.price
          else
            resp.write "Item not found"
            resp.status = 400
          end
      elsif req.path != ("/items")
        resp.write "Route not found"
        resp.status = 404
      end
      #
      resp.finish
      # binding.pry
      # 0
    end
end
