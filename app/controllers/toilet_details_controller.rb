# -*- coding: utf-8 -*-
class ToiletDetailsController < UIViewController
  def loadView
    self.view = UIView.alloc.initWithFrame([[0, 0], [100, 200]])
  end

  def viewDidLoad
    super
    view.styleId = 'toiletDetails'
  end

  def showDetailsForToilet(toilet)
    @address = UILabel.new
    @address.font = UIFont.systemFontOfSize(14)
    @address.text = toilet.address
    @address.textAlignment = UITextAlignmentCenter
    @address.textColor = UIColor.whiteColor
    @address.backgroundColor = UIColor.clearColor

    @model = UILabel.new
    @model.font = UIFont.systemFontOfSize(14)
    @model.text = toilet.label
    @model.textAlignment = UITextAlignmentCenter
    @model.textColor = UIColor.whiteColor
    @model.backgroundColor = UIColor.clearColor

    @type = UILabel.new
    @type.font = UIFont.systemFontOfSize(14)
    @type.text = toilet.is_suitable_for_handicap? ? 'Accès handicapé' : "Pas d'accès handicapé"
    @type.textAlignment = UITextAlignmentCenter
    @type.textColor = UIColor.whiteColor
    @type.backgroundColor = UIColor.clearColor

    @action = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @action.setTitle('Fermer', forState:UIControlStateNormal)
    @action.addTarget(self, action:'closeDetails', forControlEvents:UIControlEventTouchUpInside)
    @action.styleId = 'appButton'

    Motion::Layout.new do |layout|
      layout.view view
      layout.subviews "address" => @address, "label" => @model, "type" => @type, "action" => @action
      layout.metrics "top" => 10, "margin" => 5, "marginButton" => 80, "height" => 40
      layout.vertical "|-top-[address(==height)]-margin-[label(==height)]-margin-[type(==height)]-margin-[action(==height)]"
      layout.horizontal "|-margin-[address]-margin-|"
      layout.horizontal "|-margin-[label]-margin-|"
      layout.horizontal "|-margin-[type]-margin-|"
      layout.horizontal "|-marginButton-[action]-marginButton-|"
    end
  end

  def closeDetails
    self.dismissSemiModalView
  end
end
