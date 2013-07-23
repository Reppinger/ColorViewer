class ColorsController < UIViewController
  def initWithNibName(name, bundle:bundle)
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('Colors', image: nil, tag: 1)
    self
  end

  def viewDidLoad
    super
    self.view.backgroundColor = UIColor.whiteColor
    @label = create_color_label
    self.view.addSubview(@label)
    self.title = 'Colors'
    ['red', 'green', 'blue'].each_with_index do |color_text, index|
      button = create_color_button(color_text, index)
      self.view.addSubview(button)
    end
  end

  def create_color_label
    label = UILabel.alloc.initWithFrame(CGRectZero)
    label.text = 'Colors'
    label.sizeToFit
    label.center = [self.view.frame.size.width / 2,
                     self.view.frame.size.height / 2]
    label.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
    label
  end

  def create_color_button(color_text, index)
    color = UIColor.send("#{color_text}Color")
    button_width = 80
    button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    button.setTitle(color_text, forState: UIControlStateNormal)
    button.setTitleColor(color, forState: UIControlStateNormal)
    button.sizeToFit
    button.frame = [
        [30 + index*(button_width + 10),
         @label.frame.origin.y + button.frame.size.height + 30],
        [80, button.frame.size.height]
    ]
    button.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
    button.addTarget(self, action: "tap_#{color_text}", forControlEvents: UIControlEventTouchUpInside)
    button
  end

  def tap_red
    controller = ColorDetailController.alloc.initWithColor(UIColor.redColor)
    self.navigationController.pushViewController(controller, animated:true)
  end

  def tap_green
    controller = ColorDetailController.alloc.initWithColor(UIColor.greenColor)
    self.navigationController.pushViewController(controller, animated:true)
  end

  def tap_blue
    controller = ColorDetailController.alloc.initWithColor(UIColor.blueColor)
    self.navigationController.pushViewController(controller, animated:true)
  end


end