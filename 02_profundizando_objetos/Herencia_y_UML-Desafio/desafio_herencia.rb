class Appointment
    attr_accessor :location, :purpose, :hour, :min

    def initialize(location, purpose,hour,min)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end

end

class MonthlyAppointment < Appointment
    attr_accessor :day

    def initialize(location, purpose,hour,min,day)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
        @day = day
    end

    def occurs_on?(day)
        if @day == day
            true
        else
            false
        end
    end

    def to_s
        puts "Please go to #{@location} for #{@purpose}. The appointment is on the #{@day}th of every month at #{@hour}:#{@min}"
    end

end

class DailyAppointment < Appointment
    def occurs_on?(hour,min)
        if @hour == hour && @min == min
            true
        else
            false
        end
    end

    def to_s
        puts "Please go to #{@location} for #{@purpose}. The appointment is daily at #{@hour}:#{@min}"
    end
end

class OneTimeAppointment < Appointment
    attr_accessor :day, :month, :year
    def initialize(location, purpose,hour,min,day,month,year)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
        @day = day
        @month = month
        @year = year
    end

    def occurs_on?(day,month,year)
        if @day == day && @month == month && @year==year
            true
        else
            false
        end
    end

    def to_s
        puts "Please go to #{@location} for #{@purpose}. The appointment is on #{@month}/#{@day}/#{@year} at #{@hour}:#{@min}"
    end


end

App1 = Appointment.new('aqui', 'porque si',17,50)
puts App1
App2 = MonthlyAppointment.new('aqui', 'porque si',17,50,28)
puts App2
App3 = DailyAppointment.new('aqui', 'porque si',17,50)
puts App3
App4 = OneTimeAppointment.new('aqui', 'porque si',17,50,28,11,2021)
puts App4