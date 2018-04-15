module Intercon
  class InviteCustomer
    DISTANCE_KM = 100

    attr_reader :file_name

    def initialize(file_name)
      @file_name = file_name
    end

    def print_customers(customers)
      p customers.map { |c| "#{c[:user_id]} - #{c[:name]}" }.join("\n") + "\n"
    end

    def customers_invited
      filter_by_distance(customer_list(file_name), DISTANCE_KM)
    end

    def customer_list
      []
    end

    def filter_by_distance(loc, d)
      []
    end
  end
end
