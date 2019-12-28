require 'pry'
class Doctor 
    attr_reader :name
    @@all = [] 
    def initialize(name)
        @name = name
        @@all << self 
    end
    def self.all
        @@all
    end
    def appointments
        Appointment.all.select {|a| a.doctor == self}
    end
    def new_appointment(patient, date)
        Appointment.new(date, patient,self)
    end
    def patients 
        appointments.map {|a| a.patient}
    end
end