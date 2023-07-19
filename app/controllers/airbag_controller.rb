class AirbagController < ApplicationController
  def get
    message = {
      # EDITOR=vim rails credentials:edit to add username and password
      credentials: {
        username: Rails.application.credentials.username,
        password: Rails.application.credentials.password
      },
      # each value should be a real one
      parameters: {
        culture: 'nl or en or de or fr or es or pl',
        airbagid: 123456
      }
    }
    response = @cars_client.call(:airbags_get, message: message)
    document = response.doc   # document is a Nokogiri object
    # traverse nokogiri object to extract data
    # for example, below gets "count" element
    # document.at_xpath("//cars:count", {"cars"=>"https://www.onderdelenlijn.nl/services/cars/v2.asmx"})
  end
end


text_doc = <<-DOC
<?xml version="1.0" encoding="utf-8"?>
<soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">
  <soap12:Body>
    <airbags_getResponse xmlns="https://www.onderdelenlijn.nl/services/cars/v2.asmx">
      <airbags_getResult>
        <response>
          <status>int</status>
          <messages>
            <message xsi:nil="true" />
            <message xsi:nil="true" />
          </messages>
          <milliseconds>int</milliseconds>
          <sessionid>string</sessionid>
        </response>
        <parameters>
          <culture>nl or en or de or fr or es or pl</culture>
          <airbagid>int</airbagid>
        </parameters>
        <result>
          <count>int</count>
          <list>
            <airbag xsi:nil="true" />
            <airbag xsi:nil="true" />
          </list>
        </result>
      </airbags_getResult>
    </airbags_getResponse>
  </soap12:Body>
</soap12:Envelope>
DOC
