//
//  ViewController.swift
//  linkid_mmp
//
//  Created by Tuan Dinh on 12/30/2022.
//  Copyright (c) 2022 Tuan Dinh. All rights reserved.
//

import UIKit
import linkid_mmp

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        LinkIdMMP.event()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
