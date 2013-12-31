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
  app.provisioning_profile = "/Users/julien/Library/MobileDevice/Provisioning\ Profiles/2AE0D68A-3CB6-47E0-99E5-D929F0DFF0DE.mobileprovision"

  app.pods do
    pod 'KNSemiModalViewController'
  end

  app.files += Dir.glob(File.join(app.project_dir, 'style/**/*.rb'))

  app.info_plist["UIViewControllerBasedStatusBarAppearance"] = false
  app.info_plist["UIStatusBarStyle"] = "UIStatusBarStyleLightContent"
end
