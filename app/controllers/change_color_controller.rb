class ChangeColorController < UIViewController
  attr_accessor :color_detail_controller

  def viewDidLoad
    super
    self.title = 'Change Color'
    self.view.backgroundColor = UIColor.whiteColor
    @text_field = create_text_field
    self.view.addSubview @text_field
    button = create_button(@text_field)
    self.view.addSubview button
  end

  def create_text_field
    text_field = UITextField.alloc.initWithFrame(CGRectZero)
    text_field.borderStyle = UITextBorderStyleRoundedRect
    text_field.textAlignment = UITextAlignmentCenter
    text_field.placeholder = 'Enter a color'
    text_field.frame = [CGPointZero, [150, 32]]
    text_field.center = [self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 170]
    text_field
  end

  def create_button(text_field)
    button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    button.setTitle('Change', forState: UIControlStateNormal)
    button.frame = [[text_field.frame.origin.x, text_field.frame.origin.y + text_field.frame.size.height + 10],
                    text_field.frame.size]
    button.addTarget(self, action: 'change_color', forControlEvents: UIControlEventTouchUpInside)
    button
  end

  def change_color
    color_text = @text_field.text.downcase
    color_method = "#{color_text}Color"
    if UIColor.respond_to? color_method
      color = UIColor.send color_method
    else
      @text_field.text = 'Error!'
      return
    end
    self.color_detail_controller.view.backgroundColor = color
    self.dismissViewControllerAnimated true, completion: lambda{}
  end

end