describe Driver do

  it 'has a name' do
    expected_name = 'expected_name'
    driver = Driver.new(expected_name)

    expect(driver.name).to eq(expected_name)
  end

  it 'has a default distance of 0' do
    driver = Driver.new('random')

    expect(driver.distance).to eq(0)
  end

  it 'calculates trip minutes to 0' do
    driver = Driver.new('random')

    expect(driver.calc_minutes).to eq(0)
  end

  it 'calculates trip speed to 0' do
    driver = Driver.new('random')

    expect(driver.calc_trip_speed).to eq(0)
  end
end