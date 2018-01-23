# ContainerView-TabBar
This Project Helps in integration of conatiner View , Multiple View Controllers, toolBar And Tabbar Controller That can switch between multiple Tabs 

# Flow
    -----> Main View Controller
       ---> Up Bar
       ---> Bottom ToolBar
            ---> Three Buttons
       ---> ContainerView
            ---> Tab Bar Controller
            ---> Second Vc on Click of Second Button
            ---> Third Vc on Click of Third Button

# Reference to Tabbar Controller 
    
      private lazy var FirstObject: mainTabController =
    {
        // Instantiate View Controller
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "mainTabController") as! mainTabController
        
        // Add View Controller as Child View Controller
        self.addChildViewController(viewController)
        return viewController
    }()
    
    
# Adding Tabbar in container View

    private func add(asChildViewController viewController: UIViewController)
    {
        // Configure Child View
        viewController.view.frame = CGRect(x: 0, y: 0, width: self.firstContainer.frame.size.width, height: self.firstContainer.frame.size.height)
        
        // Add Child View Controller
        addChildViewController(viewController)
        viewController.view.translatesAutoresizingMaskIntoConstraints = true
        
        // Add Child View as Subview
        firstContainer.addSubview(viewController.view)
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
# Expected Output : Basic Output

![simulator screen shot - iphone 8 plus - 2018-01-23 at 10 15 33](https://user-images.githubusercontent.com/26831784/35258700-41295962-0027-11e8-8477-000144ded5d6.png)

# When Clicked on Buttons In ToolBar Added - Output

![simulator screen shot - iphone 8 plus - 2018-01-23 at 10 15 35](https://user-images.githubusercontent.com/26831784/35258719-6bf51744-0027-11e8-8b4a-561571a474be.png)
