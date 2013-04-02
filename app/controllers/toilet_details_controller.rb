# -*- coding: utf-8 -*-
class ToiletDetailsController < UIViewController
  def loadView
    self.view = UIView.alloc.initWithFrame([[0, 0], [100, 200]])
  end

  def viewDidLoad
    super
    view.styleId = 'toiletDetails'
  end

  def showDetailsForToilet(toilet, location)
    @address = UILabel.new
    @address.numberOfLines = 0
    @address.font = UIFont.systemFontOfSize(14)
    @address.text = toilet.address
    @address.textAlignment = UITextAlignmentRight
    @address.textColor = UIColor.whiteColor
    @address.backgroundColor = UIColor.clearColor

    @distance = UILabel.new
    @distance.font = UIFont.systemFontOfSize(14)
    @distance.text = toilet.distanceFrom(location)
    @distance.textAlignment = UITextAlignmentCenter
    @distance.textColor = UIColor.whiteColor
    @distance.backgroundColor = UIColor.clearColor
    @distance.styleId = 'distanceLabel'

    @type = UILabel.new
    @type.text = "\u267F"
    @type.textAlignment = UITextAlignmentCenter
    @type.textColor = UIColor.whiteColor
    @type.backgroundColor = UIColor.clearColor
    @type.styleId = toilet.is_suitable_for_handicap? ? 'accessibleLabel' : 'nonAccessibleLabel'

    @action = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @action.setTitle('Fermer', forState:UIControlStateNormal)
    @action.addTarget(self, action:'closeDetails', forControlEvents:UIControlEventTouchUpInside)
    @action.styleId = 'appButton'

    Motion::Layout.new do |layout|
      layout.view view
      layout.subviews "address" => @address, "distance" => @distance, "type" => @type, "action" => @action
      layout.metrics "top" => 20, "margin" => 10, "marginLeft" => 40, "marginButton" => 80, "height" => 20, "heightButton" => 40
      layout.vertical "|-top-[distance(==height)][address(==height)]-margin-[type(==height)]-margin-[action(==heightButton)]"
      layout.horizontal "|-margin-[distance]-margin-|"
      layout.horizontal "|-marginLeft-[address]-margin-|"
      layout.horizontal "|-marginLeft-[type]-margin-|"
      layout.horizontal "|-marginButton-[action]-marginButton-|"
    end
  end

  def closeDetails
    self.dismissSemiModalView
  end
end
