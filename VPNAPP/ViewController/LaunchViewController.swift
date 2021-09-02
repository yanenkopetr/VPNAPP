//
//  LaunchViewController.swift
//  VPNAPP
//
//  Created by Petr Yanenko on 02.09.2021.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.performSegue(withIdentifier: "showMain", sender: self)
        }
    }
}
