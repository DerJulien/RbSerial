require "rubyserial"

class Com

  def initialize (baud = 9600, data = 8)
    @baud_rate = baud;
    @data_bits = data;
    #---
    @sp = nil;
    @port = nil;
	end

  def list_ports ()
    ports = [];
    1.upto 64 do |index|
      begin
        serial = Serial.new  portname = 'COM' + index.to_s;
        ports << portname if serial;
        serial.close;
      rescue  Exception => e
        ports << portname if e.to_s.include? "ACCESS_DENIED";
      end
    end
    return ports;
  end

  def open (port)
    puts("trying to open SerialPort <" + port + ">")
    begin
      @sp = Serial.new(port, @baud_rate, @data_bits);
      @port = port;
    rescue Exception => e
       puts("could not open SerialPort <" + port + ">, raised error : " + e.to_s);
       return false;
    end
    puts("successfully opened SerialPort <" + port + ">");
    return true;
  end

  def shutdown (reason)
    @sp.close
  end
  def write (message)
    @sp.write(message);
  end
  def read ()
    return @sp.getbyte
  end
end
