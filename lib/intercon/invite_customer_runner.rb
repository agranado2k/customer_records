module Intercon
  class InviteCustomerRunner
    def self.customer_records(point, distance, file_path, io)
      customer_model = CustomerModel.new(file_path, io)
      filter = Filter.new(point, distance)
      ic = InviteCustomer.new(customer_model, filter)
      print_customers(ic.customers_invited, io)
    end

    def self.print_customers(customers, io)
      io.print customers.map { |c| "#{c[:user_id]} - #{c[:name]}" }.join("\n") + "\n"
    end
  end
end

