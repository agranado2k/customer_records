module Intercon
  class InviteCustomer
    DISTANCE_KM = 100

    attr_reader :customer_model, :filter

    def initialize(customer_model, filter)
      @customer_model = customer_model
      @filter = filter
    end

    def customers_invited
      filter_by_distance(customer_list).sort_by { |c| c[:user_id] }
    end

    def customer_list
      customer_model.customer_list
    end

    def filter_by_distance(loc)
      filter.filter_by_distance(loc)
    end
  end
end
