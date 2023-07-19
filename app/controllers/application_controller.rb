class ApplicationController < ActionController::API
  attr_reader :cars_client

  def initialize
    super
    # This might need more settings such as authentication, ssl.
    @cars_client = Savon.client(
      wsdl: "https://services.onderdelenlijn.nl/cars/v2.asmx?WSDL"
    )
  end
end
