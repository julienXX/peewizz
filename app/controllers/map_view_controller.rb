class MapViewController < UIViewController

  def loadView
    self.view = MKMapView.alloc.init
    view.delegate = self
  end

  def viewDidLoad
    view.frame = UIScreen.mainScreen.bounds

    region = MKCoordinateRegionMake(CLLocationCoordinate2D.new(48.85896, 2.34691), MKCoordinateSpanMake(0.2, 0.2))
    self.view.userTrackingMode = true
    self.view.setShowsUserLocation(true)
    self.view.setRegion(region)

    Toilet::All.each { |toilet| self.view.addAnnotation(toilet) }
  end

  ViewIdentifier = 'ViewIdentifier'

  def mapView(mapView, viewForAnnotation:toilet)
    if view = mapView.dequeueReusableAnnotationViewWithIdentifier(ViewIdentifier)
      view.annotation = toilet
      if view.annotation.class == MKUserLocation
        return nil;
      else
        view.annotation
      end
    else
      view = MKPinAnnotationView.alloc.initWithAnnotation(toilet, reuseIdentifier:ViewIdentifier)
      view.canShowCallout = true
      view.animatesDrop = true
      button = UIButton.buttonWithType(UIButtonTypeDetailDisclosure)
      button.addTarget(self, action: :'showDetails:', forControlEvents:UIControlEventTouchUpInside)
      view.rightCalloutAccessoryView = button
    end
    view
  end

  def showDetails(sender)
    if view.selectedAnnotations.size == 1
      toilet = view.selectedAnnotations[0]
      controller = ToiletDetailsController.alloc.init
      controller.showDetailsForToilet(toilet)
      self.presentSemiViewController(controller)
    end
  end
end
