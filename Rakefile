# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  app.name = 'PeeWizz'
  app.frameworks += ['CoreLocation', 'MapKit', 'AddressBook', 'QuartzCore', 'MessageUI']
  app.icons = ["Icon.png"]
  app.fonts = ["font.ttf"]
  app.provisioning_profile = "/Users/julien/Library/MobileDevice/Provisioning\ Profiles/5B1843F5-50F1-45EF-8C0F-579F85A60424.mobileprovision"

  app.pods do
    pod 'KNSemiModalViewController'
  end

  app.files += Dir.glob(File.join(app.project_dir, 'style/**/*.rb'))
end
