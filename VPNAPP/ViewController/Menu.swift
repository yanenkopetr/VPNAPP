//
//  Menu.swift
//  VPNAPP
//
//  Created by Petr Yanenko on 03.09.2021.
//

import UIKit

class Menu: UIViewController {
    
    @IBOutlet weak var backButton:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func _back(_ sender:UIButton) {
        if let _ = navigationController {
            self.navigationController?.popViewController(animated: true)
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func shareJailbreak(_ sender:UIButton) {
        if let name = URL(string: "https://itunes.apple.com/us/app/myapp/idxxxxxxxx?ls=1&mt=8"), !name.absoluteString.isEmpty {
          let objectsToShare = [name]
          let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
          self.present(activityVC, animated: true, completion: nil)
        } else {
          // show alert for not available
        }
    }
}
