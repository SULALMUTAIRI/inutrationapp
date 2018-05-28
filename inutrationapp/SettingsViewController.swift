//
//  SettingsViewController.swift
//  inutrationapp
//
//  Copyright © 2018 Deakin. All rights reserved.
//

import UIKit
import CoreData

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var activityL: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var calL: UITextField!
    @IBOutlet weak var mealPlan: UITextField!
    let userid = UserDefaults.standard.integer(forKey: "userid")
    var activity_data = ["High", "Medium","Low"]
    var mealplan_data = ["Weight Loss","Diabets Friendly"]
    var cal_data = ["1200","1500","1800"]
    
     var activityLevel_value = 0
     var mealPlan_value = 0
     var cal_value = 0
    
      @IBAction func editingBegin(_ sender: UITextField) {
        selectedText = sender.tag
        print("tag \(selectedText)")
        
    }
    var selectedText = 0
    @IBAction func selactivity(_ sender: UITextField) {
        selectedText = sender.tag
        print("tag \(selectedText)")
        
    }
    @IBAction func selMealPlan(_ sender: UITextField) {
        selectedText = sender.tag
        print("tag \(selectedText)")
        
    }
    
    @IBAction func selCL(_ sender: UITextField) {
        selectedText = sender.tag
        print("tag \(selectedText)")
        
    }
    var activitPickerView = UIPickerView()
    var mealPickerView = UIPickerView()
    var calPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activitPickerView.delegate = self
        activitPickerView.dataSource = self
        activityL.inputView = activitPickerView
        
        mealPickerView.delegate = self
        mealPickerView.dataSource = self
        mealPlan.inputView = mealPickerView
        
        calPickerView.delegate = self
        calPickerView.dataSource = self
        calL.inputView = calPickerView
        
        var settings = getUserSettings(userid: Int32(userid))
        if settings != nil {
            weight.text = String(describing: settings!.weight)
            activityL.text = activity_data [Int(settings!.activityLevel.advanced(by: -1))]
            height.text = String(describing: settings!.height)
            mealPlan.text = mealplan_data [Int(settings!.mealPlan.advanced(by: -1))]
            calL.text = cal_data [Int(settings!.caloieLevel.advanced(by: -1))]
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func updateSettings(_ sender: UIButton) {
        let weight_val = Int32(weight.text!)
        let height_val = Double(height.text!)
        print("1: \(activityLevel_value) \n 2: \(mealPlan_value) \n 3: \(cal_value)")
        if weight_val! > 0 && height_val! > 0 && activityLevel_value > 0 && mealPlan_value > 0 && cal_value > 0 {
        var usersettings = getUserSettings(userid: Int32(userid))
            if usersettings == nil {
                print("nil value")
                usersettings = UserSettings(context: context)
            }
            usersettings?.userID = Int32(userid)
            usersettings?.height = height_val!
            usersettings?.weight = weight_val!
            usersettings?.activityLevel = Int32(activityLevel_value)
            usersettings?.mealPlan = Int32(mealPlan_value)
            usersettings?.caloieLevel = Int32(cal_value)
            appDelegate.saveContext()
        }
    }
    func getUserSettings(userid: Int32) ->  UserSettings? {
        
        do {
            let fetchRequest :NSFetchRequest<UserSettings> =  UserSettings.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "userID ==%i", userid)
            let result = try context.fetch(fetchRequest)
            print (String(result.count))
            if result.count > 0 {
                return result.last
            }
        }
        catch {
            print(error)
        }
        return nil;
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print("selected \(selectedText)")
        var count = 0
        if selectedText == 1 {
            count =  activity_data.count
        }
        if selectedText == 2 {
            count =  mealplan_data.count
        }
        
        if selectedText == 3 {
            count = cal_data.count
        }
        print("count \(count)")
        return count
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if selectedText == 1 {
            activityL.text = activity_data[row]
            activityLevel_value = row + 1
            
        }
        if selectedText == 2 {
            mealPlan.text = mealplan_data[row]
            mealPlan_value = row + 1
        }
        
        if selectedText == 3 {
            calL.text = cal_data [row]
            cal_value = row + 1
        }
        
        //activityL.text = activity_data[row]
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if selectedText == 1 {
            return activity_data[row]
        }
        if selectedText == 2 {
            return mealplan_data[row]
        }
        
        if selectedText == 3 {
            return cal_data[row]
        }
        return "" //activity_data[row]
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
