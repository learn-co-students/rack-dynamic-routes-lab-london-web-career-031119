class Application
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
       item_name = req.path.split("/items/").last 
       if item = @@items.find{|x| x.name == item_name}
        resp.write @item.price
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

    #   resp.write "Item not found"
    #   resp.status = 400

    #   song_title = req.path.split("/songs/").last #turn /songs/Sorry into Sorry
    #   song = @@songs.find{|s| s.title == song_title}