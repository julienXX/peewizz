class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = Motion::Xray::XrayWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = MapViewController.alloc.init
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    true
  end
end
