require_relative "lib/com.rb";

c = Com.new();
ports = c.list_ports();
puts(ports.to_s + "\n")
c.open(gets.chomp.to_s);

100.times do
  r = c.read
  p r unless r == nil;
end
