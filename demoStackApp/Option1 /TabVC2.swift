//
//  TabVC2.swift
//  demoStackApp
//
//  Created by IosDeveloper on 11/06/18.
//  Copyright © 2018 iosGeek. All rights reserved.
//

import UIKit

class TabVC2: UIViewController {

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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
