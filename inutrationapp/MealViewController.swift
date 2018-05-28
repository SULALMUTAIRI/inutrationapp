//
//  MealViewController.swift
//  inutrationapp
//
//  Copyright © 2018 Deakin. All rights reserved.
//

import UIKit
import CoreData

class MealViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var meals = [MealPlan]()
    
    @IBOutlet weak var tableView: UITableView!
    let userid = UserDefaults.standard.integer(forKey: "userid")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            meals = try context.fetch(MealPlan.fetchRequest())
            for each in meals {
                print ("Break \(each.breakfast)\n calorie \(each.calorie)")
            }
        }
        catch {
            
        }
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customViewCell") as! CustomTableViewCell
        cell.lblBreakfast.text = meals[indexPath.row].breakfast
        cell.lblLunch.text = meals[indexPath.row].lunch
        cell.lblSnack.text = meals[indexPath.row].snack
        cell.lblDinner.text = meals[indexPath.row].dinner
        print ("Table \(meals[indexPath.row].breakfast)")
        return cell
    }
    func getBestUserMeal() -> MealPlan? {
        var cal_level = 0
        do {
            let fetchRequest :NSFetchRequest<UserPreferences> =  UserPreferences.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "userID ==%i", userid)
            let result = try context.fetch(fetchRequest)
            if result.count > 0 {
                let prefernces = result.first
                
                let fetchRequestseting :NSFetchRequest<UserSettings> =  UserSettings.fetchRequest()
                fetchRequestseting.predicate = NSPredicate(format: "userID ==%i", userid)
                let resultsetting = try context.fetch(fetchRequestseting)
                
                if resultsetting.count > 0 {
                    let settings = resultsetting.first
                    if settings?.caloieLevel == 1 {
                        cal_level = 1200
                    }
                    if settings?.caloieLevel == 2 {
                        cal_level = 1500
                    }
                    if settings?.caloieLevel == 3 {
                        cal_level = 1800
                    }
                    
                    let fetchRequestmeal :NSFetchRequest<MealPlan> =  MealPlan.fetchRequest()
                    fetchRequestmeal.predicate = NSPredicate(format: "calorie ==%i", cal_level)
                    let resultmeal = try context.fetch(fetchRequestmeal)
                    
                    if resultmeal.count > 0 {
                        
                    }
                    
                }
            }
        }
        catch {
            print(error)
        }
        return nil;
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
