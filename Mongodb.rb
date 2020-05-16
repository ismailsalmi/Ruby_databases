require 'mongo'

begin
    
    # Open connection
    mongo = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'users')
    collection = mongo[:users]

    # Insert a single document
    user_informations = {

        "fname"=>"yassin",
        "lname"=>"salmi",
        "age"=>13
    
    }

    result = collection.insert_one(
        
        user_informations)

    puts result.n     # Output user.insert 1

    # Insert a many documents
    users_informations = [

        {
        "fname"=>"yusuf",
        "lname"=>"salmi",
        "age"=>7
        },
        {
        "fname"=>"zoheir",
        "lname"=>"salmi",
        "age"=>15
        },

    ]
    results = collection.insert_many(
        
        users_informations
    
    )
    puts results.n     # Output user.insert 2

    # Remove one document
    delete_one = collection.delete_one(
        
        {"fname"=> "samir"})

    puts delete_one.deleted_count

    # Delete multiple documents
    delete_multiple = collection.delete_many(

        {"lname"=>"salmi"}

    )
    puts delete_multiple.deleted_count

    # Update a single document
    collection.update_one(

        {"fname" => "zoheir"}, {"$set" => {"age" => 16 }}
    
    )

    # Update a multiple documents
    collection.update_many(

        {}, {"$set" => {"age" => 9 }}

    )

    # Find one document
    query_find_one = {"age" => 27}
    puts collection.find( query_find_one ).first

    # Retrieve all documents
    collection.find.each do |document|

       puts document

    end


rescue Mongo::Error => error

    puts error.message

ensure

    # Close connection
    collection.close()
    
end    
