//
//  ViewController.swift
//  ThinkIT
//
//  Created by Makrem chambah on 29/12/2020.
//

import UIKit
import Foundation

class ViewController: UIViewController {

//    MARK:- Outlets declarations
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var nameField     : UITextField!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var closeBTN: UIButton!
    
    
//    MARK:- let and var declarations
    let ud = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designOutlet()
        
        if ud.string(forKey: "UserName")! != nil{
            let second = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "second") as! SecondViewController
            self.navigationController?.pushViewController(second, animated: true)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        setupKeyboardDismissRecognizer()
        
    }

 
    @IBAction func closeOnAction(_ sender: Any) {
        bgView.isHidden = true
        popUpView.isHidden = true
    }
    
    @IBAction func continueOnClick(_ sender: Any) {
        print(nameField.text!)
        ud.set(nameField.text!, forKey: "UserName")
        if nameField.text! == "" {
            popUpView.isHidden = false
            bgView.isHidden = false
        }
        else{
            let second = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "second") as! SecondViewController
            self.navigationController?.pushViewController(second, animated: true)
        }
        
    }
    
    
    func designOutlet(){
        continueButton.layer.cornerRadius = 5
        nameField.layer.cornerRadius      = 5
        nameField.layer.borderColor       = UIColor.black.cgColor
        nameField.layer.borderWidth       = 0.5
        bgView.isHidden                   = true
        popUpView.isHidden                = true
        
        popUpView.layer.cornerRadius       = 10
        popUpView.backgroundColor          = UIColor.white
        popUpView.layer.shadowColor        = UIColor.gray.cgColor
        popUpView.layer.shadowColor        = UIColor.gray.cgColor
        popUpView.layer.shadowOpacity      = 1
        popUpView.layer.shadowOffset       = .zero
        popUpView.layer.shadowRadius       = 7
        popUpView.layer.shadowPath         = UIBezierPath(rect: popUpView.bounds).cgPath
        popUpView.layer.shouldRasterize    = true
        popUpView.layer.rasterizationScale = UIScreen.main.scale
        popUpView.layer.borderWidth        = 1
        popUpView.layer.borderColor        = UIColor.systemGray5.cgColor
        
        closeBTN.layer.cornerRadius       = 10
        
        
        
        
    }
    
    
}


extension ViewController {
    
    @objc func keyboardWillShow(notification: NSNotification) {
          if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
              if self.view.frame.origin.y == 0 {
                  self.view.frame.origin.y -= keyboardSize.height/2
              }
          }
      }
      @objc func keyboardWillHide(notification: NSNotification) {
          if self.view.frame.origin.y != 0 {
              self.view.frame.origin.y = 0
          }
      }
       func setupKeyboardDismissRecognizer(){
           let tapRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(
               target: self,
               action: #selector(dismissKeyboard))
           view.addGestureRecognizer(tapRecognizer)
       }
       @objc func dismissKeyboard(_ views: UIView)
       {
           view.endEditing(true)
       }

}
