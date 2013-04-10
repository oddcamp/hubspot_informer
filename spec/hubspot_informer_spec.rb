require 'vcr'
require 'faraday'
require_relative 'support/vcr'
require_relative '../lib/hubspot_informer.rb'


unless ENV['HUBSPOT_TEST_PORTAL_ID'] && ENV['HUBSPOT_TEST_FORM_GUID']
  warn ["WARNING: You need to set the HUBSPOT_TEST_PORTAL_ID and HUBSPOT_TEST_FORM_GUID",
    "environment variables or the calls to the HubSpot API will be invalid."].join("\n")
end

describe "HubspotInformer" do
  it "adds a subscriber to a list" do
    VCR.use_cassette('add_subscriber') do
      portal_id = ENV['HUBSPOT_TEST_PORTAL_ID']
      form_guid = ENV['HUBSPOT_TEST_FORM_GUID']
      puts "#{portal_id}/#{form_guid}"
      hubspot = HubspotInformer.new(
        portal_id: portal_id,
        form_guid: form_guid,
      )
      params = { firstname: 'John', lastname: 'Doe', email: 'john.doe@example.com' }
      response = hubspot.submit params
      response.should eql nil
    end
  end

  it "raises an exception when an error HTTP status code is returned" do
    VCR.use_cassette('raise_exception') do
      portal_id = ENV['HUBSPOT_TEST_PORTAL_ID']
      form_guid = 'thisisnogood'
      hubspot = HubspotInformer.new(
        portal_id: portal_id,
        form_guid: form_guid,
      )
      params = { firstname: 'John', lastname: 'Doe', email: 'john.doe@example.com' }
      lambda { hubspot.submit params }.should raise_error(HubspotInformer::HubspotInformerError)
    end
  end
end
