module Intercon
  class Filter
    EARTH_RADIUS_KM = 6371.00

    attr_reader :point, :distance

    def initialize(point, distance)
      @point = point
      @distance = distance
    end

    def filter_by_distance(customers)
      customers.select { |c| calculate_distance(c[:latitude], c[:longitude], point[:latitude], point[:longitude]) <= distance }
    end

    def calculate_distance(lat_a, lng_a, lat_b, lng_b)
      d_lat = (lat_a - lat_b).to_rad
      d_lng = (lng_a - lng_b).to_rad

      a = Math.sin(d_lat/2)**2 + Math.cos(lat_a.to_rad) * Math.cos(lat_b.to_rad) * Math.sin(d_lng/2) ** 2
      d = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
      d * EARTH_RADIUS_KM
    end
  end
end
