//
//  TabVC3.swift
//  demoStackApp
//
//  Created by IosDeveloper on 11/06/18.
//  Copyright © 2018 iosGeek. All rights reserved.
//

import UIKit

class TabVC3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func navigateToDemoScreen(_ sender: UIButton) {
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "DemoVC") as! DemoVC
        self.navigationController?.pushViewController(VC, animated: true)
    }

}
