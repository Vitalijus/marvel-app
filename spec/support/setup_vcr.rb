require 'vcr'

VCR.configure do |c|
  config.cassette_library_dir = "#{::Rails.root}/spec/vcr_cassettes"
  c.hook_into :webmock
  config.ignore_localhost = true
  c.configure_rspec_metadata!
end

WebMock.allow_net_connect!
