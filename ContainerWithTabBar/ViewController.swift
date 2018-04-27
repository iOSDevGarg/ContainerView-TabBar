//
//  ViewController.swift
//  ContainerWithTabBar
//
//  Created by IosDeveloper on 23/01/18.
//  Copyright © 2018 iOSDeveloper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstContainer: UIView!
    
    private var myToolbar: UIToolbar!
    var curentObjectAdded : UIViewController?
    
    //MARK:- Create Weak Refrence for VC1
    private lazy var FirstObject: mainTabController =
    {
        // Instantiate View Controller
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "mainTabController") as! mainTabController
        
        // Add View Controller as Child View Controller
        self.addChildViewController(viewController)
        return viewController
    }()
    
    private lazy var SecondObject: VC2 =
    {
        // Instantiate View Controller
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "VC2") as! VC2
        
        // Add View Controller as Child View Controller
        self.addChildViewController(viewController)
        return viewController
    }()
    
    private lazy var ThirdObject: VC3 =
    {
        // Instantiate View Controller
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "VC3") as! VC3
        
        // Add View Controller as Child View Controller
        self.addChildViewController(viewController)
        return viewController
    }()
    
    //MARK:- Create Function to add VC1 As Subview
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
    
    private func remove(asChildViewController viewController: UIViewController)
    {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        firstContainer.willRemoveSubview(viewController.view)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.add(asChildViewController: FirstObject)
        
        // make uitoolbar instance
        myToolbar = UIToolbar(frame: CGRect(x: 0,y: self.view.bounds.size.height - 44, width: self.view.bounds.size.width,height: 40.0))
        
        // set the position of the toolbar
        myToolbar.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height-20.0)
        
        // set the color of the toolbar
        myToolbar.barStyle = .blackTranslucent
        myToolbar.tintColor = UIColor.white
        myToolbar.backgroundColor = UIColor.black
        
        // make a button
        let myUIBarButtonGreen: UIBarButtonItem = UIBarButtonItem(title: "First", style:.plain, target: self, action: #selector(ViewController.onClickBarButton(sender:)))
        myUIBarButtonGreen.tag = 1
        
        let myUIBarButtonBlue: UIBarButtonItem = UIBarButtonItem(title: "Second", style:.plain, target: self, action: #selector(ViewController.onClickBarButton(sender:)))
        myUIBarButtonBlue.tag = 2
        
        let myUIBarButtonRed: UIBarButtonItem = UIBarButtonItem(title: "Third", style:.plain, target: self, action: #selector(ViewController.onClickBarButton(sender:)))
        myUIBarButtonRed.tag = 3
        
        // add the buttons on the toolbar
        myToolbar.items = [myUIBarButtonGreen, myUIBarButtonBlue, myUIBarButtonRed]
        
        // add the toolbar to the view.
        self.view.addSubview(myToolbar)
    }
    
    // called when UIBarButtonItem is clicked.
    @objc internal func onClickBarButton(sender: UIBarButtonItem)
    {
        if self.curentObjectAdded != nil {
            self.remove(asChildViewController: self.curentObjectAdded!)
        }
        else{
            print("Not added yet")
        }
        
        switch sender.tag
        {
        case 1:
            //Load first controller object
            self.add(asChildViewController: FirstObject)
            self.curentObjectAdded = FirstObject
            break
            
        case 2:
            //Load Second controller object
            self.add(asChildViewController: SecondObject)
            self.curentObjectAdded = SecondObject
            break
            
        case 3:
            //Load Third controller object
            self.add(asChildViewController: ThirdObject)
            self.curentObjectAdded = ThirdObject
            break
            
        default:
            print("ERROR!!")
        }
    }


}

