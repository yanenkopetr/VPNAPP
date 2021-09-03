//
//  ContactSupport.swift
//  VPNAPP
//
//  Created by Petr Yanenko on 03.09.2021.
//

import UIKit

class ContactSupport: UIViewController {
    
    var placeholders = ["Tell us a bit more about your connection issues", "Tell us a bit more about your slow browsing", "Tell us a bit more about something else"]

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let id = segue.identifier else { return }
        
        if id == "tellAboutProblem" {
            guard let tag = (sender as? UIButton)?.tag else { return }
            
            let vc = segue.destination as! ContacSupportProblem
            vc.placeHolder = placeholders[tag]
        }
    }
}
