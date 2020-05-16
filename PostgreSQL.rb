require 'pg'

begin
    # Open connection
    postgres_sql = PG.connect :host=>'localhost', :port=>5432, 
    :dbname=>'users', :user=>'postgres', :password=>'1991'

    # Creat a table in database
    postgres_sql.exec "create table if not exists users(
        fname text, lname text, age int)"

    # # Insert data in table
    first_name = "samir"
    last_name = "salmi"
    age = 25
    postgres_sql.exec "insert into users values(
        '#{first_name}', '#{last_name}', '#{age}')"
    
    # # Update row
    newAge = 26
    oldAge = 25
    postgres_sql.exec "update users set age=#{newAge} where age=#{oldAge}"

    # # Delete row
    age = 25
    postgres_sql.exec "delete from users where age=#{age}"

    # Retrieve rows
    results = postgres_sql.exec "select fname, lname, age from users"
    results.each {|row| puts row}


rescue PG::Error => error

    puts error.message 
    
ensure
    # Close connection
    postgres_sql.close if postgres_sql
    
end