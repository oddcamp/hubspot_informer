VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr'
  c.hook_into :faraday
  c.filter_sensitive_data('<PORTAL_ID>') { ENV['HUBSPOT_TEST_PORTAL_ID'] }
  c.filter_sensitive_data('<FORM_GUID>') { ENV['HUBSPOT_TEST_FORM_GUID'] }
end

