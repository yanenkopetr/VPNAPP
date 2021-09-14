//
//  Menu.swift
//  VPNAPP
//
//  Created by Petr Yanenko on 03.09.2021.
//

import UIKit
import RxSwift
class Menu: UIViewController {
    
    @IBOutlet weak var backButton:UIButton!
    @IBOutlet weak var faqButton:UIButton!
    @IBOutlet weak var aboutUsButton:UIButton!
    @IBOutlet weak var restorePurchaseButton:UIButton!
    @IBOutlet weak var shareJailbreak:UIButton!

    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
        setActions()
    }
    
    func setActions() {
        
        shareJailbreak.rx.tap.subscribe(onNext: {
            if let name = URL(string: "https://itunes.apple.com/us/app/myapp/idxxxxxxxx?ls=1&mt=8"), !name.absoluteString.isEmpty {
              let objectsToShare = [name]
              let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
              self.present(activityVC, animated: true, completion: nil)
            } else {
              // show alert for not available
            }
        }).disposed(by: self.disposeBag)
        
        faqButton.rx.tap.subscribe(onNext: {
            if let url = URL(string: "https://community.jailbreakvpn.com/faq") {
                UIApplication.shared.open(url)
            }
        }).disposed(by: self.disposeBag)
        
        aboutUsButton.rx.tap.subscribe(onNext: {
            if let url = URL(string: "https://community.jailbreakvpn.com/faq") {
                UIApplication.shared.open(url)
            }
        }).disposed(by: self.disposeBag)
        
        restorePurchaseButton.rx.tap.subscribe(onNext: {
            if let url = URL(string: "https://jailbreakvpn.com/topup") {
                UIApplication.shared.open(url)
            }
        }).disposed(by: self.disposeBag)
    }
    
    @IBAction func _back(_ sender:UIButton) {
        if let _ = navigationController {
            self.navigationController?.popViewController(animated: true)
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
