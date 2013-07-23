class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    controller = ColorsController.alloc.initWithNibName(nil, bundle: nil)
    nav_controller = UINavigationController.alloc.initWithRootViewController(controller)
    tab_controller = UITabBarController.alloc.initWithNibName(nil, bundle: nil)
    top_nav_controller = create_top_color_nav_controller
    tab_controller.viewControllers = [nav_controller, top_nav_controller]
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible
    @window.rootViewController = tab_controller
    true
  end

  def create_top_color_nav_controller
    top_controller = ColorDetailController.alloc.initWithColor(UIColor.purpleColor)
    top_controller.title = 'Top Color'
    UINavigationController.alloc.initWithRootViewController(top_controller)
  end
end
