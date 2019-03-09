class Application
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    @@items = []
    
    #some other miscellaneous stuff I was trying
    # #item_name = req.params["item_name"]
    # if req.path=="/items/#{item_name}"
    # if req.path==/items/:name
    
    #what sort of works but not really
    if req.path.match(/items/)
      item_req = req.params["item"]
        if @@items.include?(item_req) 
          price = item_req.price
          resp.write "#{price}"
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

 