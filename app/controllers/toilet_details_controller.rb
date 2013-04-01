class ToiletDetailsController < UIViewController
  def loadView
    self.view = UIView.alloc.initWithFrame([[0, 0], [100, 300]])
  end

  def viewDidLoad
    super
    @background = UIImageView.alloc.initWithImage("texture".uiimage)
    self.view.addSubview(@background)
  end

  def showDetailsForToilet(toilet)
    @label = UILabel.alloc.initWithFrame(CGRectMake(0, 0, 0, 0))
    @label.text = toilet.type
    @label.sizeToFit
    @label.center = CGPointMake(self.view.frame.size.width, self.view.frame.size.height / 3)
    self.view.addSubview @label
  end
end
