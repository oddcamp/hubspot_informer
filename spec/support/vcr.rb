VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr'
  c.hook_into :faraday
  c.filter_sensitive_data('<KEY>') do |interaction|
    interaction.request.headers['Authorization'].first
  end
  c.filter_sensitive_data('<MAILING_LIST>') { ENV['APSIS_TEST_MAILING_LIST'] }
end

