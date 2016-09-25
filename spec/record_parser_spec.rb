describe RecordParser do

  describe 'when parsing Drivers' do
    it 'can parse a Driver record' do
      driver = RecordParser::parse('Driver Dan')

      expect(driver.name).to eq('Dan')
    end
  end

  describe 'when parsing Trips' do

    let(:trip_record) {'Trip Dan 07:15 07:45 17.3'}

    it 'can parse out a name' do
      trip = RecordParser::parse(trip_record)

      expect(trip.name).to eq('Dan')
    end

    it 'can parse out the distance' do
      trip = RecordParser::parse(trip_record)

      expect(trip.distance).to eq(17.3)
    end
  end

end