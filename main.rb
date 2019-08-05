require_relative "lib/com.rb";

c = Com.new();
ports = c.list_ports();
puts(ports.to_s + "\n")
c.open("COM3");

10.times do
  c.read();
end
