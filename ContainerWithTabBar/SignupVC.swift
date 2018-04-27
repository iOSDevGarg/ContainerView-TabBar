//
//  SignupVC.swift
//  ContainerWithTabBar
//
//  Created by IosDeveloper on 27/04/18.
//  Copyright © 2018 iOSDeveloper. All rights reserved.
//

import UIKit

protocol getDeatilsFromSignUp : class {
    func passParameters(demoString:String)
}

class SignupVC: UIViewController {
    var delegate : getDeatilsFromSignUp?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func submitAction(_ sender: UIButton) {
        delegate?.passParameters(demoString: "your pasowrd or whatever you want to pass")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
