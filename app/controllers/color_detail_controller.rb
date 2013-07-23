class ColorDetailController < UIViewController
  def initWithColor(color)
    self.initWithNibName(nil, bundle: nil)
    @color = color
    self
  end

  def viewDidLoad
    super
    self.view.backgroundColor = @color
    self.title = 'Detail'
    right_button = create_change_button
    self.navigationItem.rightBarButtonItem = right_button
  end

  def create_change_button
    UIBarButtonItem.alloc.initWithTitle('Change',
                                        style: UIBarButtonItemStyleBordered,
                                        target: self,
                                        action: 'change_color')
  end

  def change_color
    controller = ChangeColorController.alloc.initWithNibName(nil, bundle:nil)
    controller.color_detail_controller = self
    self.presentViewController(UINavigationController.alloc.initWithRootViewController(controller),
                               animated: true,
                               completion: lambda{})
  end
end