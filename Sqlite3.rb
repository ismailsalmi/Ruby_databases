require 'sqlite3'

# Creat a database
begin

    sqlite_db = SQLite3::Database.new("data.db")

    # Creat a table in database
    creat_table = "
    CREATE TABLE IF NOT EXISTS users(fname TEXT,
    lname TEXT, age INT)"
    sqlite_db.execute creat_table

    # Insert data in table
    first_name = "samir"
    last_name = "salmi"
    age = 25
    sqlite_db.execute "INSERT INTO users VALUES 
    ( ?, ?, ? )", first_name, last_name, age

    # Update row 
    age = "27".to_i
    first_name = "ismail".downcase
    sqlite_db.execute "UPDATE users SET age=? WHERE fname=?", age, first_name

    # Delete row
    age = 26
    sqlite_db.execute "DELETE FROM users WHERE age=?", age

    # Retrieve rows
    sqlite_db.execute "SELECT fname, lname, age FROM users" do |row|
        print "#{row}\n"
end

rescue SQlite3::Exception => error

    puts error

ensure

    # Close connection
    sqlite_db.close if sqlite_db

end
