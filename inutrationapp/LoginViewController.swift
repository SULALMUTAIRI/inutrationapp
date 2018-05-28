//
//  ViewController.swift
//  inutrationapp
//
//  Copyright © 2018 Deakin. All rights reserved.
//
import UIKit
import CoreData
var useridglb: Int32 = 0
class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var lblMsg: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func btnLogin(_ sender: UIButton) {
        
        let userID = checkLogin(email: txtEmail.text!, pass: txtPass.text!)
        if userID > 0 {
            UserDefaults.standard.set(userID, forKey: "userid")
            UserDefaults.standard.set(txtEmail.text, forKey: "username")
            UserDefaults.standard.set(true, forKey: "isLogin")
            UserDefaults.standard.synchronize()
            self.dismiss(animated: true, completion: nil)
        }
        else {
          //  var alert = UIAlertController(title: "Invalid login!", message: "Invalid Data!", preferredStyle: .alert)
            txtPass.text = ""
        }
        
    }
    func checkLogin(email: String, pass: String) -> Int32 {
        var useridglb: Int32 = -1
        var users = [UserBasicProfile]()
        do {
        users = try context.fetch(UserBasicProfile.fetchRequest())
            for each in users {
                print ("Email \(each.email)\n Password \(each.password)")
            }
        }
        catch {
            
        }
        
        do {
            let fetchRequest :NSFetchRequest<UserBasicProfile> =  UserBasicProfile.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "email ==%@ and password ==%@", txtEmail.text!,txtPass.text!)
            let result = try context.fetch(fetchRequest)
            print (String(result.count))
            if result.count > 0 {
                useridglb = result.first!.id
                print(String(useridglb))
            }
        }
        catch {
            print(error)
        }
        return Int32(useridglb)
    }
    
}

