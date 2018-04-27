//
//  VC2.swift
//  ContainerWithTabBar
//
//  Created by IosDeveloper on 23/01/18.
//  Copyright © 2018 iOSDeveloper. All rights reserved.
//

import UIKit

protocol finalOutput : class {
    func finalOutputFromVC2(passedString:String)
}

class VC2: UIViewController,getDeatilsFromSignUp
{
    var delegate : finalOutput?
    
    func passParameters(demoString: String)
    {
        /// Perform required operations here
        print(demoString)
    }
    

    @IBOutlet weak var vc2ContainerView: UIView!
    
    private lazy var signUpClassObject: SignupVC =
    {
        // Instantiate View Controller
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SignupVC") as! SignupVC
        viewController.delegate = self
        // Add View Controller as Child View Controller
        self.addChildViewController(viewController)
        return viewController
    }()
    
    //MARK:- Create Function to add VC1 As Subview
    private func add(asChildViewController viewController: UIViewController)
    {
        // Configure Child View
        viewController.view.frame = CGRect(x: 0, y: 0, width: self.vc2ContainerView.frame.size.width, height: self.vc2ContainerView.frame.size.height)
        
        // Add Child View Controller
        addChildViewController(viewController)
        viewController.view.translatesAutoresizingMaskIntoConstraints = true
        
        // Add Child View as Subview
        vc2ContainerView.addSubview(viewController.view)
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController)
    {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        vc2ContainerView.willRemoveSubview(viewController.view)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        DispatchQueue.main.async {
            self.add(asChildViewController: self.signUpClassObject)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
