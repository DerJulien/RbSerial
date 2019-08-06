require_relative "lib/com.rb";

c = Com.new();

ports = c.list_ports();
puts(ports.to_s + "\n")

c.open(gets.chomp.to_s);
c.write_ensure("test");

#100.times do
#  puts(c.read_string());
#end
