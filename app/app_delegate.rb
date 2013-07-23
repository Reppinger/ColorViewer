class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    nav_controller = create_nav_controller
    top_color_nav_controller = create_top_color_nav_controller
    tab_controller = create_tab_controller(nav_controller, top_color_nav_controller)
    create_main_window(tab_controller)
    true
  end

  def create_nav_controller
    controller = ColorsController.alloc.initWithNibName(nil, bundle: nil)
    UINavigationController.alloc.initWithRootViewController(controller)
  end

  def create_top_color_nav_controller
    top_controller = ColorDetailController.alloc.initWithColor(UIColor.purpleColor)
    top_controller.title = 'Top Color'
    UINavigationController.alloc.initWithRootViewController(top_controller)
  end

  def create_tab_controller(nav_controller, top_color_nav_controller)
    tab_controller = UITabBarController.alloc.initWithNibName(nil, bundle: nil)
    tab_controller.viewControllers = [nav_controller, top_color_nav_controller]
    tab_controller
  end

  def create_main_window(tab_controller)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible
    @window.rootViewController = tab_controller
  end

end
