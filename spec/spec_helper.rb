
if ENV['COVERAGE'] || ENV['TRAVIS']
	begin
		require 'simplecov'
		
		SimpleCov.start do
			add_filter "/spec/"
		end
		
		if ENV['TRAVIS']
			require 'coveralls'
			Coveralls.wear!
		end
	rescue LoadError
		warn "Could not load simplecov: #{$!}"
	end
end

require "bundler/setup"
require "build/uri"

RSpec.shared_examples "valid triplet" do
	it "should be valid triplet" do
		is_expected.to be_kind_of Build::URI::Triplet
	end
end

RSpec.shared_examples "valid absolute" do
	it "should be valid absolute" do
		is_expected.to be_kind_of Build::URI::Absolute
	end
end

RSpec.shared_examples "valid relative" do
	it "sohuld be a valid relative" do
		is_expected.to be_kind_of Build::URI::Relative
	end
end

RSpec.configure do |config|
	# Enable flags like --only-failures and --next-failure
	config.example_status_persistence_file_path = ".rspec_status"

	config.expect_with :rspec do |c|
		c.syntax = :expect
	end
end
