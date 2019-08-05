require_relative "lib/com.rb";

c = Com.new();
ports = c.list_ports();
puts(ports)
puts()
c.open(gets.chomp.to_s);
