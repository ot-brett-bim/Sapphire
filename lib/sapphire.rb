$:.unshift File.expand_path("..", __FILE__)

require 'rubygems'
require 'Platform'
require 'yaml'
require 'selenium-webdriver'
require 'delegate'
require 'Forwardable'

require 'sapphire/Adapters'
require 'sapphire/Testing'
require 'sapphire/Web'
require 'sapphire/DSL'
require 'sapphire/Extensions'
require 'sapphire/CommandLine'
require 'sapphire/Configuration'
require 'sapphire/Data'
require 'sapphire/Virtualization'
require 'sapphire/TeamCity'

module Sapphire
  module Sapphire
    include DSL
    include DSL::Scenarios
    include DSL::Browser
    include DSL::Configuration
    include DSL::Data
    include DSL::TestPlans
    include DSL::Coverage
    include Configuration
    include DataAbstractions
    include JobAbstractions
    include WebAbstractions
    include Testing
    include Testing::TeamCity
    include UI
  end
end

$driver = Sapphire::WebAbstractions::MetaBrowser.new(nil)