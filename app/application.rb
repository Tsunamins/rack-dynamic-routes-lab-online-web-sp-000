class Application
 
 @@items = []
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
   
  
    
    if req.path.match(/items/)
      
      item_name = req.path.split("/items/").last
      binding.pry
      if @@items.include?(item_name)
        @@items.each do |item_price| 
          provide_price = item_price.price
        
        resp.write provide_price
        
          else 
            resp.write "Item not found"
            resp.status 400
          end
        
      
      # item = @@items.find{|i| i.name == item_name}
     
      #   resp.write item.price
          
        
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end

 