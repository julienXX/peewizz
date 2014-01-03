# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'motion-testflight'
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  app.name = 'PeeWizz'
  app.frameworks += ['CoreLocation', 'MapKit', 'QuartzCore']
  app.icons = ["Icon.png", "Icon@2x.png"]

  app.provisioning_profile = "/Users/julien/Library/MobileDevice/Provisioning\ Profiles/2AE0D68A-3CB6-47E0-99E5-D929F0DFF0DE.mobileprovision"

  app.testflight.sdk = 'vendor/TestFlight'
  app.testflight.api_token = '478946297e24711412051e5c23fa1187_MzAzNzQ4MjAxMi0wMi0wNCAxMDo1Njo1MC45ODc2NzU'
  app.testflight.team_token = 'fda1be9e2e09e5290b024c5309cfc36c_MjA3MTYzMjAxMy0wNC0wMyAwNToyOToxOS43Nzk5MTE'
  app.testflight.app_token = 'c20e22eb-c39e-4bd7-9c6e-70735d255af7'

  app.info_plist["UIViewControllerBasedStatusBarAppearance"] = false
  app.info_plist["UIStatusBarStyle"] = "UIStatusBarStyleLightContent"
end
