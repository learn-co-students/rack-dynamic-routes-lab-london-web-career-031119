class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env) #get '/items/Apples'
    #req.path => /items/Apples

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      items_names = @@items.map{|item| item.name}
      item = @@items.find{|item| item.name == item_name}

      if items_names.include?(item_name)
        # item = @@items.find_by(name: "#{item_name}")
        resp.write item.price
        resp.status = 200
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
