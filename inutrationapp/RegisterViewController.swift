//
//  RegisterViewController.swift
//  inutrationapp
//
//  Copyright © 2018 Deakin. All rights reserved.
//

import UIKit
import CoreData
class RegisterViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtDoB: UITextField!
    @IBOutlet weak var lblMsg: UILabel!
    let datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        
    }
    func createDatePicker() {
        datePicker.datePickerMode = .date
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButon = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButon], animated: false)
        txtDoB.inputAccessoryView = toolbar
        txtDoB.inputView = datePicker
    }
    @objc func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        txtDoB.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @IBAction func btnRegister(_ sender: UIButton) {
       //let userProfile = UserProfile(name: txtName.text!, email: txtEmail.text!, password: txtPassword.text!, dob: datePicker.date)
       //let userBasicProfile = UserBasicProfile()
        if let email = txtEmail.text,let pass = txtPassword.text,let name = txtName.text, email.count > 0 && pass.count > 0 && name.count > 0 {   //and let name = txtName.text?.count > 0) {
            let user=addProfile()
            appDelegate.saveContext()
        if user.id > 0 {          
            UserDefaults.standard.set(user.id, forKey: "userid")
            UserDefaults.standard.set(user.email, forKey: "username")
            
            var alert = UIAlertController(title: "Sucessful Registration!", message: "User Added!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                 self.dismiss(animated: true, completion: nil)
            })
            alert.addAction(action)
            self.present(alert,animated: true, completion: nil)
            
        }
        else {
            var alert = UIAlertController(title: "Invalid Data!", message: "User not Added!", preferredStyle: .alert)
            let okaction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okaction)
            self.present(alert,animated: true, completion: nil)
            
        }
     }
    }
    func addProfile() -> UserBasicProfile {
        let user = UserBasicProfile(context: context)
        user.name = txtName.text
        user.email = txtEmail.text
        user.password = txtPassword.text
        user.dob=datePicker.date as NSDate
        user.id = getLastID()
        return user
    }
    func getLastID() -> Int32 {
        var users = [UserBasicProfile]()
        var count = 1;
        do {
            users = try context.fetch(UserBasicProfile.fetchRequest())
            count = users.count
        }
        catch {
            //
        }
        return Int32(count);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
}
