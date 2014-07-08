class AdminUser < ActiveRecord::Base
    
    # This is one way to configure a different table name in the event a table is renamed
    # We can also just rename the file, and the class name
    # This class was renamed from User to AdminUser
    # self.table_name = "admin_users"

end
