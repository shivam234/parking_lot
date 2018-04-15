require 'parking_lot_base'
RSpec.describe 'ParkingLot' do
  subject { ParkingLot.new }
  describe 'create_slots' do
    let(:string) { "Created a parking lot with 5 slots" }
	it 'create_slots' do
	  expect(subject.send :create_parking_lot, 5).to eq string
	end
  end

  describe 'park' do
	subject(:parking_lot) { ParkingLot.new(1)}
	let(:string) { "Allocated slot number: 1" }
	it 'park_car with slots' do
	  expect(parking_lot.send :park, "KA-01-HH-1234" ,"White").to eq string
	end
  end

  describe 'free_slot with parked car' do
  	subject(:parking_lot) { ParkingLot.new(1)}
	let(:string) { "Slot number 1 is free" }
	it 'free slot' do
	  parking_lot.send :park, "KA-01-HH-1234" ,"White"
	  expect(parking_lot.send :leave, "1").to eq string
	end
  end

  describe 'show parking status' do
  	subject(:parking_lot) { ParkingLot.new(1)}
	let(:hash) { {1 => {:registration_no => "KA-01-HH-1234", :color => "White"}} }
	it 'status' do
	  parking_lot.send :park, "KA-01-HH-1234" ,"White"
	  expect(parking_lot.send :status).to eq hash
	end
  end

  describe "registration no of cars with a particular color" do
    subject(:parking_lot) { ParkingLot.new(2)}
    let(:string) { "KA-01-HH-1234, KA-04-HH-1239" }
    it 'registration_nos with color' do
	  parking_lot.send :park, "KA-01-HH-1234" ,"White"
	  parking_lot.send :park, "KA-04-HH-1239" ,"White"
	  expect(parking_lot.send :registration_numbers_for_cars_with_colour, "White").to eq string
	end
  end

  describe "registration no of cars with a particular color not found" do
    subject(:parking_lot) { ParkingLot.new(2)}
    let(:string) { "Not found" }
    it 'registration_nos with color not found' do
	  parking_lot.send :park, "KA-01-HH-1234" ,"White"
	  parking_lot.send :park, "KA-04-HH-1239" ,"White"
	  expect(parking_lot.send :registration_numbers_for_cars_with_colour, "Black").to eq string
	end
  end

  describe "slot_numbers of cars with a particular color" do
    subject(:parking_lot) { ParkingLot.new(2)}
    let(:string) { "1, 2" }
    it 'slot_nos with color' do
	  parking_lot.send :park, "KA-01-HH-1234" ,"White"
	  parking_lot.send :park, "KA-04-HH-1239" ,"White"
	  expect(parking_lot.send :slot_numbers_for_cars_with_colour, "White").to eq string
	end
  end

  describe "slot_numbers of cars with a particular color not found" do
    subject(:parking_lot) { ParkingLot.new(2)}
    let(:string) { "Not found" }
    it 'slot_nos with color not found' do
	  parking_lot.send :park, "KA-01-HH-1234" ,"White"
	  parking_lot.send :park, "KA-04-HH-1239" ,"White"
	  expect(parking_lot.send :slot_numbers_for_cars_with_colour, "Black").to eq string
	end
  end

  describe "slot number of car with a registration no" do
    subject(:parking_lot) { ParkingLot.new(2)}
    let(:string) { "1" }
    it 'slot_nos with registration_no' do
	  parking_lot.send :park, "KA-01-HH-1234" ,"White"
	  parking_lot.send :park, "KA-04-HH-1239" ,"White"
	  expect(parking_lot.send :slot_number_for_registration_number, "KA-01-HH-1234").to eq string
	end
  end

  describe "slot number of car with a registration no not found" do
    subject(:parking_lot) { ParkingLot.new(2)}
    let(:string) { "Not found" }
    it 'slot_nos with registration_no not found' do
	  parking_lot.send :park, "KA-01-HH-1234" ,"White"
	  parking_lot.send :park, "KA-04-HH-1239" ,"White"
	  expect(parking_lot.send :slot_number_for_registration_number, "KA-01-HH-1235").to eq string
	end
  end
end