module Intercon
  class InviteCustomerRunner

    def self.run(point, distance, file_path)
      customer_model = CustomerModel.new(file_path)
      filter = Filter.new(point, distance)
      ic = InviteCustomer.new(customer_model, filter)
      print_customers(ic.customers_invited)
    end

    def self.print_customers(customers)
      p customers.map { |c| "#{c[:user_id]} - #{c[:name]}" }.join("\n") + "\n"
    end

  end
end
