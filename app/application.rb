class Application
 
 @@items = []
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
   
  
    
    if req.path.match(/items/)
      
      item_name = req.path.split("/items/").last
      
      @@items.each do |find_item| 
        if find_item == item_name 
          resp.write find_item.price
        else 
          resp.write "Item not found"
            resp.status 400
          end 
        end 
      # item = @@items.find{|i| i.name == item_name}
      
      #     resp.write item.price
    else
            
        end
        
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end

 