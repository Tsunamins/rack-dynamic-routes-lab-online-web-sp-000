class Application
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    
    
    if req.path=="/items"
      resp.write "You requested the songs"
        #item_name = Item.name
        item_req = req.params["item"]
        if @@items.include?(item_req) 
          resp.write "#{item.price}"
        else 
          resp.write "Item not found"
          resp.status 400
        end
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end