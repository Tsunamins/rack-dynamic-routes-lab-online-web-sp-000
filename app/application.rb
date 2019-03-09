class Application
 
 @@items = []
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
   
  
    
    if req.path.match(/items/)
      
      item_name = req.path.split("/items/").last
      
      if @@items.include?(item_name) 
        @@items.find do |i|
          i.name == item_name
          resp.write i.price
        end 
      else 
        resp.write "Item not found"
          resp.status 400
      
      item = @@items.find{|i| i.name == item_name}
      binding.pry
      if item == nil
        
        
      else 
        resp.write item.price
          
        end
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end

 