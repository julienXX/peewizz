# -*- coding: utf-8 -*-
class ToiletDetailsController < UIViewController

  layout :main do
    self.view.backgroundColor = UIColor.alloc.initWithPatternImage(UIImage.imageNamed("texture.png"))

    subview(UILabel,
            top: 60, left: 30,
            width: 60, height: 60,
            backgroundColor: UIColor.blueColor,
            textColor: UIColor.whiteColor,
            textAlignment: UITextAlignmentCenter,
            text: @toilet.distanceFrom(@location)
            )
    subview(UILabel,
            top: 60, left: 120,
            width: 60, height: 60,
            backgroundColor: UIColor.greenColor,
            textColor: UIColor.whiteColor,
            textAlignment: UITextAlignmentCenter,
            text: @toilet.is_suitable_for_handicap?.to_s
            )
  end

  def loadView
    self.view = UIView.alloc.initWithFrame([[0, 0], [100, 200]])

    layer = self.view.layer
    layer.setCornerRadius(30.0)
    layer.setBorderColor(UIColor.lightGrayColor)
    layer.setBorderWidth(1.5)
    layer.setShadowColor(UIColor.blackColor)
    layer.setShadowOpacity(0.8)
    layer.setShadowRadius(3.0)
    layer.setShadowOffset(CGSizeMake(2.0, 2.0))
  end

  def viewDidLoad
    super
  end

  def showDetailsForToilet(toilet, location)
    @toilet = toilet
    @location = location
  end
end
