# -*- coding: utf-8 -*-
class ToiletDetailsController < UIViewController
  def loadView
    self.view = UIView.alloc.initWithFrame([[0, 0], [100, 200]])
  end

  def viewDidLoad
    super
    @background = UIColor.alloc.initWithPatternImage("texture".uiimage)
    self.view.backgroundColor = @background
  end

  def showDetailsForToilet(toilet)
    @label = UILabel.new
    @label.font = UIFont.systemFontOfSize(14)
    @label.text = toilet.label
    @label.textAlignment = UITextAlignmentCenter
    @label.textColor = UIColor.whiteColor
    @label.backgroundColor = UIColor.clearColor

    @type = UILabel.new
    @type.font = UIFont.systemFontOfSize(14)
    @type.text = toilet.type == 'WCH2' ? 'Accès handicapé' : "Pas d'accès handicapé"
    @type.textAlignment = UITextAlignmentCenter
    @type.textColor = UIColor.whiteColor
    @type.backgroundColor = UIColor.clearColor

    @action = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @action.setTitle('Fermer', forState:UIControlStateNormal)
    @action.addTarget(self, action:'closeDetails', forControlEvents:UIControlEventTouchUpInside)

    Motion::Layout.new do |layout|
      layout.view view
      layout.subviews "label" => @label, "type" => @type, "action" => @action
      layout.metrics "top" => 20, "margin" => 20, "marginButton" => 80, "height" => 40
      layout.vertical "|-top-[label(==height)]-margin-[type(==height)]-margin-[action(==height)]"
      layout.horizontal "|-margin-[label]-margin-|"
      layout.horizontal "|-margin-[type]-margin-|"
      layout.horizontal "|-marginButton-[action]-marginButton-|"
    end
  end

  def closeDetails
    self.dismissSemiModalView
  end
end
