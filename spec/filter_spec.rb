require 'rspec_helper'

describe Intercon::Filter do
  let(:dublin) { { latitude: 53.339428, longitude: -6.257664 } }
  let(:customer_4) { { latitude: 53.2451022 , longitude: -6.238335 } }
  let(:customer_21) { { latitude: 51.802, longitude: -9.442 } }
  let(:distance_km) { 100 }
  subject { described_class.new(dublin, distance_km) }

  describe '.calculate_distance' do
    context 'calculate the distance from any two points on Earth' do
      let(:lat_a) { 51.885 }
      let(:lng_a) { 0.235 }
      let(:lat_b) { 49.008 }
      let(:lng_b) { 2.549 }
      let(:result) { 359.3823602146921 }

      it { expect(subject.calculate_distance(lat_a, lng_a, lat_b, lng_b)).to eq(result) }
    end

    context 'calculate the distance from Dublin to customer 4 on Earth that is less than 100 KM' do
      let(:result) { 10.566936288868758 }

      it { expect(subject.calculate_distance(dublin[:latitude], dublin[:longitude], customer_4[:latitude], customer_4[:longitude])).to eq(result) }
    end

    context 'calculate the distance from Dublin to customer 21 on Earth that is greater than 100 KM' do
      let(:result) { 274.79780021881373 }

      it { expect(subject.calculate_distance(dublin[:latitude], dublin[:longitude], customer_21[:latitude], customer_21[:longitude])).to eq(result) }
    end
  end

  describe '.filter_by_distance' do
    context 'when the distance is less than 100' do
      let(:customers) { [customer_4] }

      it { expect(subject.filter_by_distance(customers)).to_not be_empty }
    end

    context 'when the distance is greater than 100' do
      let(:customers) { [customer_21] }

      it { expect(subject.filter_by_distance(customers)).to be_empty }
    end
  end
end
