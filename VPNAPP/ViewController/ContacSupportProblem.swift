//
//  ContacSupportProblem.swift
//  VPNAPP
//
//  Created by Petr Yanenko on 03.09.2021.
//

import UIKit
import RxSwift

class ContacSupportProblem: UIViewController {
    
    var type:String?
    var placeHolder:String!
    
    var disposeBag = DisposeBag()
    
    let client = APIClient.shared
    
    @IBOutlet weak var messageTextField:UITextView!
    @IBOutlet weak var sendMessage:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
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
    
    func setupUI() {
        
        messageTextField.delegate = self
        messageTextField.backgroundColor = .white
        
        if let placeHolder = placeHolder {
            messageTextField.text = placeHolder
            messageTextField.textColor = UIColor.lightGray
        }
        
        setActions()
    }
    
    func setActions() {
        sendMessage.rx.tap.subscribe(onNext: {
            if let message = self.messageTextField.text, !message.isEmpty {
                self.client.sendEmail(text: message).subscribe(onNext: { response in
                    self._back(self.sendMessage)
                }).disposed(by: self.disposeBag)
            }
        }).disposed(by: self.disposeBag)
    }

}
extension ContacSupportProblem: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            if let placeHolder = placeHolder {
                textView.text = placeHolder
            }
            
            textView.textColor = UIColor.lightGray
        }
    }

}
