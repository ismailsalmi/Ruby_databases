require 'redis'
require 'json'

begin
    
    redis = Redis.new(host: "localhost")

    data = {

        user1=>{
          "fname" => "ismail", 
          "lname" => "salmi", 
          "age" => 26
     },
        user2=>{
          "fname" => "samir", 
          "lname" => "salmi", 
          "age" => 24
     }

   }

   # Insert data 
   redis.set("user1", JSON.dump(data))
   
   # Reading all keys
   puts redis.keys('*')

   # Reading data
   results = redis.get("user1")
   JSON.load(results).each { |doc| puts doc }
   
   # Delete data
   redis.del("user1")

rescue StandardError => error

    puts error.message
    
end
