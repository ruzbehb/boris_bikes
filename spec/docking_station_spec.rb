require './lib/docking_station'

describe DockingStation do
	
	let(:bike) { Bike.new }
	let(:station) { DockingStation.new }
	let(:station) { DockingStation.new(:capacity => 20) }

	def fill_station(station)
  		20.times { station.dock(Bike.new) }
	end

	it 'should accept a bike' do
		bike = Bike.new
		station = DockingStation.new
		expect(station.bike_count).to eq(0)
		station.dock(bike)
		expect(station.bike_count).to eq(1)
	end

	it 'should release a bike' do
		station = DockingStation.new
		station.dock(bike)
		station.release(bike)
		expect(station.bike_count).to eq(0)
	end

	it 'should know when its full' do
		expect(station).not_to be_full
		fill_station(station)
		expect(station).to be_full
	end 

	it 'should not accept a bike if its full' do
		fill_station(station)
		expect(lambda { station.dock(bike) }).to raise_error(RuntimeError)
	end


end