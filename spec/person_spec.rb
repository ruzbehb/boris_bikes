require './lib/person'

describe 'Boris Bikes' do

	let(:person) {Person.new}

	it 'does not have a bike' do
		expect(person.have_bike).to be_false
	end

	it 'has a bike' do
		person = Person.new(:bike)
		expect(person.have_bike).to be_true
	end

	it 'can rent a bike from the station' do
		station = double :station
		expect(station).to receive(:release_bike)
		person.rent_bike_from(station)
	end

	it 'has the bike after renting from the station' do
		station = double :station, {:release_bike => :bike}
		person.rent_bike_from(station)
		person = Person.new(:bike)
		expect(person.have_bike).to be_true
	end


end