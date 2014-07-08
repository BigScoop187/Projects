class AlterUsers < ActiveRecord::Migration
  
  def up
  
    puts "**** Renaming table from users to admin_users ****"
    rename_table("users", "admin_users")
    
    puts "**** Adding column username to the admin_users table ****"
    add_column("admin_users", "username", :string, :limit => 25, :after => "email")
    
    puts "**** Changing the column email from [string, default => emptyString null => false] to [string, limit => 100] ****"
    change_column("admin_users", "email", :string, :limit => 100)
    
    puts "**** Renaming the password column to hashed_password ****"
    rename_column("admin_users", "password", "hashed_password")
    
    puts "**** Adding an index to the username column ****"
    add_index("admin_users", "username")
  end
  
  def down
    puts "**** Removing the index from the username column ****"
    remove_index("admin_users", "username")
    
    puts "**** Renaming the hashed_password column to password ****"
    rename_column("admin_users", "hashed_password", "password")
    
    # This is the original default made earlier
    puts "**** Changing the column email from [string, limit => 100] to [string, default => emptyString null => false] ****"
    change_column("admin_users", "email", :string, :default => "", :null => false) 
    
    puts "**** Removing the username column from the admin_users table ****"
    remove_column("admin_users", "username")
    
    puts "**** Renaming table from admin_users to users ****"
    rename_table("admin_users", "users")
  end
  
end
