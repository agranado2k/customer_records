require 'rspec_helper'

describe Intercon::InviteCustomerRunner do
  let(:dublin) { { latitude: 53.339428, longitude: -6.257664 } }
  let(:distance) { 100 }
  let(:file_name) { './spec/fixture/customers.txt' }
  let(:print_list) do
    <<~EOF
      4 - Ian Kehoe
      5 - Nora Dempsey
      6 - Theresa Enright
      8 - Eoin Ahearn
      11 - Richard Finnegan
      12 - Christina McArdle
      13 - Olive Ahearn
      15 - Michael Ahearn
      17 - Patricia Cahill
      23 - Eoin Gallagher
      24 - Rose Enright
      26 - Stephen McArdle
      29 - Oliver Ahearn
      30 - Nick Enright
      31 - Alan Behan
      39 - Lisa Ahearn
    EOF
  end
  subject { described_class.run(dublin, distance, file_name) }

  it { expect(subject).to eq(print_list) }
end
