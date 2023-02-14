class CharttestController < ApplicationController
  def index
    @customer = Customer.new
  end
end
