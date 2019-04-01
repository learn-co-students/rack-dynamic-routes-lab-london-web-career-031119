class Application
 
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
   
      if req.path.match(/item/)
        item_name = req.path.split("/items/").last
        if item =@@items.find{|i| i.name == item_name}
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
  end

# ! error 400 - Item not found
# *  resp.write "Item not found"
# *  resp.status = 400


# if req.path.match(/item/)
 
#     item_name = req.path.split("/songs/").last
#     item = @@items.find{|i| i.name == item_name}

#     resp.write song.artist



    # if req.path.match(/item/)
    #     if resp.write @@items
    #         var = @@items
    #         @@items.include? var