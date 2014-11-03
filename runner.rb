require './train'
require './coach'
require './passenger'
require './station'

train = Train.new
coach = Coach.new
passenger = Passenger.new('station1','station2')
4.times { train.hold(coach) }
10.times { train.board(passenger) }
