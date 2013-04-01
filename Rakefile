# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'PeeWizz'
  app.frameworks += ['CoreLocation', 'MapKit', 'AddressBook']
  app.icons = ["Icon.png"]

  app.pods do
    pod 'KNSemiModalViewController'
  end
end
