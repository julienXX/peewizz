# -*- coding: utf-8 -*-
class ToiletDetailsController < UIViewController
  stylesheet :main

  # layout :main do
  #   puts "=== #{@toilet.inspect}"
  #   subview(UIButton, :finished_button)
  #   subview(UILabel, text: "LOL")
  #   subview(UITextField, :field)
  # end

  def loadView
    self.view = UIView.alloc.initWithFrame([[0, 0], [100, 200]])
  end

  def viewDidLoad
    super
    @field = UITextField.new
    @field.frame = [[10, 10], [200, 50]]
    @field.textColor = UIColor.redColor
    view.addSubview(@field)

    @search = UITextField.new
    @search.frame = [[10, 70], [200, 50]]
    @search.placeholder = 'Find something...'
    @search.textColor = UIColor.redColor
    view.addSubview(@search)

    true
    # view.styleId = 'toiletDetails'
  end

  def showDetailsForToilet(toilet, location)
    @toilet = toilet
    @location = location
    # @address = UILabel.new
    # @address.numberOfLines = 0
    # @address.font = UIFont.systemFontOfSize(14)
    # @label.text = toilet.address
    # @address.textAlignment = UITextAlignmentCenter
    # @address.textColor = UIColor.whiteColor
    # @address.backgroundColor = UIColor.clearColor

    # @button = subview(UIButton.buttonWithType(UIButtonTypeRoundedRect), :button)
    # @switch = subview(UISwitch, :switch)

    # @distance = UILabel.new
    # @distance.font = UIFont.systemFontOfSize(14)
    # @distance.text = toilet.distanceFrom(location)
    # @distance.textAlignment = UITextAlignmentCenter
    # @distance.textColor = UIColor.whiteColor
    # @distance.backgroundColor = UIColor.clearColor
    # # @distance.nuiClass = 'distanceLabel'

    # @type = UILabel.new
    # @type.text = "\u267F"
    # @type.textAlignment = UITextAlignmentCenter
    # @type.textColor = UIColor.whiteColor
    # @type.backgroundColor = UIColor.clearColor
    # # @type.nuiClass = toilet.is_suitable_for_handicap? ? 'accessibleLabel' : 'nonAccessibleLabel'

    # # @action = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    # @button.setTitle('Fermer', forState:UIControlStateNormal)
    # @button.addTarget(self, action:'closeDetails', forControlEvents:UIControlEventTouchUpInside)
    # # @action.nuiClass = 'Button'

    # Motion::Layout.new do |layout|
    #   layout.view view
    #   layout.subviews "address" => @address, "distance" => @distance, "type" => @type, "action" => @action
    #   layout.metrics "top" => 20, "margin" => 10, "marginLeft" => 40, "marginButton" => 80, "height" => 30, "heightButton" => 40
    #   layout.vertical "|-top-[address(==height)]-margin-[distance(==height)]-margin-[type(==height)]-margin-[action(==heightButton)]"
    #   layout.horizontal "|-margin-[address]-margin-|"
    #   layout.horizontal "|-margin-[distance]-margin-|"
    #   layout.horizontal "|-marginLeft-[type]-margin-|"
    #   layout.horizontal "|-marginButton-[action]-marginButton-|"
    # end
  end

  def closeDetails
    self.dismissSemiModalView
  end
end
