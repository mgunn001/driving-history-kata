require 'driving_calculations'

class DrivingRecord
  include Comparable
  include DrivingCalculations

  attr_reader :name

  def initialize(name)
    @name = name
    @trips = []
  end

  def <=>(other_driving_record)
    other_driving_record.calc_total_distance <=> calc_total_distance
  end

  def add_record(record)
    if record.distance != nil
      @trips << record
    end
  end

  def calc_total_distance
    @trips.map {|trip|
      trip.distance
    }.reduce {|total, distance|
      total + distance
    }
  end

  def calc_total_minutes
    @trips.map {|trip|
      minutes = trip.calc_minutes

      minutes == nil ? 0 : minutes
    }.reduce {|total, distance|
      total + distance
    }
  end

  def calc_average_speed
    calc_speed(calc_total_minutes, calc_total_distance)
  end

  def to_s
    total_distance = calc_total_distance
    average_speed = calc_average_speed
    if (average_speed)
      "#{@name}: #{total_distance.round.to_i} miles @ #{average_speed} mph"
    else
      "#{@name}: #{total_distance.round.to_i} miles"
    end
  end
end