#http://solutions.treypiepmeier.com/2010/02/28/installing-mysql-on-snow-leopard-using-homebrew/

brew_install "mysql"

execute "copy mysql plist to ~/Library/LaunchAgents" do
  command "cp /usr/local/Cellar/mysql/5.1.47/com.mysql.mysqld.plist ~/Library/LaunchAgents"
  user WS_USER
end

execute "mysql_install_db" do
  command "mysql_install_db"
  user WS_USER
end

execute "load the mysql plist into the mac daemon startup thing" do
  command "launchctl load -w ~/Library/LaunchAgents/com.mysql.mysqld.plist"
  user WS_USER
end


#set the mysql password to be password, etc