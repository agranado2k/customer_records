module Intercon
  class CustomerModel
    attr_reader :file_path

    def initialize(file_path)
      @file_path = file_path
    end

    def customer_list
      customers = load_file
      customers.map { |c| { latitude: c['latitude'].to_f, user_id: c['user_id'], name: c['name'], longitude: c['longitude'].to_f } }
    end

    private

    def load_file
      customers = []
      text = File.open(file_path).read
      text.gsub!(/\r\n?/, "\n")
      text.each_line do |line|
        customers << JSON.parse(line)
      end
      customers
    rescue
      raise RuntimeError.new "File not found - #{file_path}"
    end
  end
end
