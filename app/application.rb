class Application
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path=="/items"
      resp.write "You requested the songs"
        item_name = Item.name
        item_req = req.params["item"]
        if item_name == item_req 
          
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end