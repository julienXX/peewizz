# -*- coding: utf-8 -*-
class ToiletDetailsController < UIViewController

  layout :main do
    self.view.backgroundColor = UIColor.alloc.initWithPatternImage(UIImage.imageNamed("texture.png"))

    distance = subview(UILabel,
                       top: 60, left: 30,
                       width: 60, height: 60,
                       backgroundColor: UIColor.blueColor,
                       textColor: UIColor.whiteColor,
                       textAlignment: UITextAlignmentCenter,
                       text: @toilet.distanceFrom(@location)
                       )
    distance.layer.cornerRadius = 5.0

    handi = subview(UILabel,
                    top: 60, left: 120,
                    width: 60, height: 60,
                    backgroundColor: UIColor.greenColor,
                    textColor: UIColor.whiteColor,
                    textAlignment: UITextAlignmentCenter,
                    text: @toilet.is_suitable_for_handicap?.to_s
                    )
    handi.layer.cornerRadius = 5.0
  end

  def loadView
    self.view = UIView.alloc.initWithFrame([[0, 0], [100, 200]])
  end

  def viewDidLoad
    super
  end

  def showDetailsForToilet(toilet, location)
    @toilet = toilet
    @location = location
  end
end
