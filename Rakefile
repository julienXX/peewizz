# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  app.name = 'PeeWizz'
  app.frameworks += ['CoreLocation', 'MapKit', 'AddressBook', 'QuartzCore', 'MessageUI']
  app.icons = ["Icon.png"]
  app.fonts = ["font.ttf"]
  app.provisioning_profile = "/Users/julien/Library/MobileDevice/Provisioning\ Profiles/EAD8A301-7066-4989-96C2-180052A82860.mobileprovision"

  app.pods do
    pod 'KNSemiModalViewController'
  end

  app.files += Dir.glob(File.join(app.project_dir, 'style/**/*.rb'))
end
