class MapViewController < UIViewController

  def loadView
    self.view = MKMapView.alloc.init
    navigationBar = UINavigationBar.appearance
    self.title = "PeeWizz"
    color = UIColor.colorWithRed(255/255.0, green: 133/255.0, blue: 0/255.0, alpha: 1.0)
    navigationBar.setBarTintColor(color)
    navigationBar.setTitleTextAttributes({NSForegroundColorAttributeName => UIColor.whiteColor})

    view.delegate = self
  end

  def viewDidLoad
    view.frame = UIScreen.mainScreen.bounds

    mapView = self.view
    region = MKCoordinateRegionMake(CLLocationCoordinate2D.new(48.85896, 2.34691), MKCoordinateSpanMake(0.2, 0.2))
    mapView.userTrackingMode = true
    mapView.setShowsUserLocation(true)
    mapView.setRegion(region)

    buttonItem = MKUserTrackingBarButtonItem.alloc.initWithMapView(mapView)
    self.navigationItem.rightBarButtonItem = buttonItem

    Toilet::ALL.each { |toilet| mapView.addAnnotation(toilet) }
  end

  ViewIdentifier = 'ViewIdentifier'

  def mapView(mapView, didUpdateUserLocation: userLocation)
    mapRegion = MKCoordinateRegion.new
    mapRegion.center = mapView.userLocation.coordinate
    mapRegion.span = MKCoordinateSpanMake(0.02, 0.02)
    mapView.setRegion(mapRegion, animated: true)
  end

  def mapView(mapView, viewForAnnotation: toilet)
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

      message = "Distance: #{toilet.distanceFrom(currentLocation)}\nAccessible: #{toilet.is_suitable_for_handicap?}"
      @alert_box = UIAlertView.alloc.initWithTitle("More infos",
                                                   message: message,
                                                   delegate: nil,
                                                   cancelButtonTitle: "ok",
                                                   otherButtonTitles:nil)

      @alert_box.show
    end
  end
end
