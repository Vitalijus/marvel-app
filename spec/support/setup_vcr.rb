require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = "spec/vcr_cassettes"
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

WebMock.allow_net_connect!
