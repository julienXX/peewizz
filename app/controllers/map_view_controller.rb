class MapViewController < UIViewController

  def loadView
    self.view = MKMapView.alloc.init
    UINavigationBar.appearance.setTitleTextAttributes({NSForegroundColorAttributeName: UIColor.whiteColor})
    self.title = "PeeWizz"
    color = UIColor.colorWithRed(103/255.0, green: 134/255.0, blue: 254/255.0, alpha: 1.0)
    UINavigationBar.appearance.setBarTintColor(color)

    view.delegate = self
  end

  def viewDidLoad
    view.frame = UIScreen.mainScreen.bounds

    region = MKCoordinateRegionMake(CLLocationCoordinate2D.new(48.85896, 2.34691), MKCoordinateSpanMake(0.2, 0.2))
    self.view.userTrackingMode = true
    self.view.setShowsUserLocation(true)
    self.view.setRegion(region)

    buttonItem = MKUserTrackingBarButtonItem.alloc.initWithMapView(self.view)
    self.navigationItem.rightBarButtonItem = buttonItem

    Toilet::ALL.each { |toilet| self.view.addAnnotation(toilet) }
  end

  ViewIdentifier = 'ViewIdentifier'

  def mapView(mapView, viewForAnnotation:toilet)
    return nil if toilet == mapView.userLocation

    if view = mapView.dequeueReusableAnnotationViewWithIdentifier(ViewIdentifier)
      view.annotation = toilet
      view.annotation
    else
      view = MKPinAnnotationView.alloc.initWithAnnotation(toilet, reuseIdentifier:ViewIdentifier)
      view.canShowCallout = true
      view.animatesDrop = false
      if toilet.is_a?(Toilet) && toilet.is_suitable_for_handicap?
        view.pinColor = MKPinAnnotationColorGreen
      end
      button = UIButton.buttonWithType(UIButtonTypeDetailDisclosure)
      button.addTarget(self, action: :'showDetails:', forControlEvents:UIControlEventTouchUpInside)
      view.rightCalloutAccessoryView = button
    end
    view
  end

  def showDetails(sender)
    if view.selectedAnnotations.size == 1
      toilet = view.selectedAnnotations[0]
      currentLocation = self.view.userLocation.coordinate
      controller = ToiletDetailsController.alloc.init
      controller.showDetailsForToilet(toilet, currentLocation)
      self.presentSemiViewController(controller)
    end
  end
end
