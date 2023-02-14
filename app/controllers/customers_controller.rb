class CustomersController < ApplicationController
  def create
    @customer = Customer.create(name: "New Customer #{rand(100)}")
    respond_to do |format|
      format.html
      format.js
      format.turbo_stream
    end
  end
end
