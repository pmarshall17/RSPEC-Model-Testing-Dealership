require 'rails_helper'

RSpec.describe Car, type: :model do

  describe 'attributes' do

    it { should respond_to :make }
    it { should respond_to :model }
    it { should respond_to :price }
    it { should respond_to :color }
    it { should respond_to :interior }
    it { should respond_to :mileage }

  end

  describe 'class methods'  do
    before(:each) do
      @car1 = Car.create(make: 'Chevy', model: 'Silverado', price: 30000)
      @car2 = Car.create(make: 'Honda', model: 'Pilot', price: 5000)
      @car3 = Car.create(make: 'Ford', model: 'Focus', price: 10000)
    end

    it 'sorts by model' do
      cars = Car.by_model
      expect(cars).to eq([@car3, @car2, @car1])
    end

    it 'sorts by make' do
      cars = Car.by_make
      expect(cars).to eq([@car1, @car3, @car2])
    end

    it 'sorts by price asc' do
      cars = Car.by_price
      expect(cars).to eq([@car2, @car3, @car1])
    end

    it 'sorts by price desc' do
      cars = Car.by_price(true)
      expect(cars).to eq([@car1, @car3, @car2])
    end

  end

  describe 'instance methods' do
    before(:each) do
      @car = Car.create(color: 'red', make: 'Chevy', model: 'Silverado', interior: 'blue', mileage: 1000, price: 30000)
    end

    it 'paints the car' do
      @car.paint('blue')
      expect(@car.color).to eq('blue')
    end

    it 'returns info' do
      expected = { color: 'red', interior: 'blue', mileage: 1000, price: 30000 }
      expect(@car.info).to eq(expected)
    end

    it 'honks the horn' do
      expect(@car.honk).to eq("beep")
    end
  end
end









