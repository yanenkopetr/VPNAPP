//
//  ContacSupportProblem.swift
//  VPNAPP
//
//  Created by Petr Yanenko on 03.09.2021.
//

import UIKit

class ContacSupportProblem: UIViewController {
    
    var type:String?
    var placeHolder:String!
    
    @IBOutlet weak var messageTextField:UITextView!
    
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
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
