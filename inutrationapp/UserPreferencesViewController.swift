//
//  UserPreferencesViewController.swift
//  inutrationapp
//
//  Copyright © 2018 Deakin. All rights reserved.
//

import UIKit
import CoreData

class UserPreferencesViewController: UIViewController {
    
    @IBOutlet weak var snack: UITextView!
    @IBOutlet weak var breakfast: UITextView!
    @IBOutlet weak var dinner: UITextView!
    @IBOutlet weak var lunch: UITextView!
    
    let userid = UserDefaults.standard.integer(forKey: "userid")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var meals = [MealPlan] ()
        do {
            meals = try context.fetch(MealPlan.fetchRequest())
            if meals.count == 0 {
                let meal1_1200 = MealPlan(context: context)
                meal1_1200.calorie = 1200
                meal1_1200.mealID = 1
                meal1_1200.breakfast = "0.5 Grapefruit 1 slice Whole Wheat Bread, 1 cup (8oz) Milk (skim, nonfat) , 0.75 cup Cereal (whole grain)"
                meal1_1200.dinner = "Bouillon, 1 Parsley Potato, (2-in diameter), 3 oz Roast Veal, lean, 0.5 cup Peas & Carrots, 1 Green Salad"
                meal1_1200.lunch = "2 slices Rye Bread , 2oz Turkey Breast, 2 stalks of Celery, 1 Carrot, 1 tbsp Ranch (fat free), 1 Peach, 1 cup Milk (skim, nonfat)"
                meal1_1200.snack = "1 medium Banana"
                
                let meal2_1200 = MealPlan(context: context)
                meal2_1200.calorie = 1200
                meal2_1200.mealID = 2
                meal2_1200.breakfast = "0.5 Grapefruit 1 slice Whole Wheat Bread, 1 cup (8oz) Milk (skim, nonfat) , 0.75 cup Cereal (whole grain)"
                meal2_1200.dinner = "Bouillon, 1 Parsley Potato, (2-in diameter), - 0.2 cup Pinto Beans, 0.2 cup Corn (boiled w/o salt),vinegar, 0.5 cup fresh Corn (boiled, Soymilk"
                meal2_1200.lunch = "2 slices Rye Bread , 2oz Turkey Breast, 2 stalks of Celery, 1 Carrot, 1 tbsp Ranch (fat free), 1 Peach, 1 cup Milk (skim, nonfat)"
                meal2_1200.snack = "1 cup Soy Yogurt"
                
                let meal3_1200 = MealPlan(context: context)
                
                meal3_1200.calorie = 1200
                meal3_1200.mealID = 3
                meal3_1200.breakfast = "1 cup Soymilk (fat free), 1 Whole Wheat Pancake, 2 tbsp Blueberry sauce, 0.5 Banana"
                meal3_1200.lunch = " Vegetarian Fajita, 1 Whole Wheat Tortilla (low sodium), 0.2 cup Red Bell Peppers, sliced, 0.2 cup Green Bell Peppers,0.2 cup Onion, tbsp Olive Oil"
                meal3_1200.dinner = " cup Vegetarian Chili, no salt added, 1.5 cup raw Spinach, w/ Flax seed (0.5 tbsp),0.33 cup tomato, 2 tbsp olive oil/red wine"
                meal3_1200.snack = "1 cup grapes"
                
                let meal1_1500 = MealPlan(context: context)
                meal1_1500.calorie = 1500
                meal1_1500.mealID = 4
                meal1_1500.breakfast = "12 oz. Coffee (w/ caffeine), 1 cup Milk (skim), 1 package Instant Oatmeal, 1 Orange"
                meal1_1500.dinner = "5 oz. Tilapia, 0.25 cup Fresh Cilantro, 1 cup Steamed Brown Rice, 0.5 cup Mixed Steamed Broccoli, 1 small Salad"
                meal1_1500.lunch = "2 slices Whole Wheat Bread, 2 oz. Turkey Breast (white, low sodium), 0.5 cup Alfalfa Sprouts, 0.2 cup Tomato ,1 cubic inch Cheddar Cheese, 0.2 cup Lettuce"
                meal1_1500.snack = "1 Medium Banana, 2 tbsp. Peanut Butter (natural)"
                
                let meal2_1500 = MealPlan(context: context)
                meal2_1500.calorie = 1500
                meal2_1500.mealID = 5
                meal2_1500.breakfast = "12 oz. Coffee (w/ caffeine), 1 cup Milk (skim), 1 package Instant Oatmeal, 1 Orange"
                meal2_1500.dinner = "5 oz. Tilapia, 0.25 cup Fresh Cilantro, 1 cup Steamed Brown Rice, & Yellow Squash, 1 small Salad"
                meal2_1500.lunch = "2 slices Whole Wheat Bread, 2 oz. Turkey Breast (white, low sodium), 0.5 cup Alfalfa Sprouts, 0.2 cup Tomato ,1 cubic inch Cheddar Cheese, 0.2 cup Lettuce"
                
                let meal3_1500 = MealPlan(context: context)
                meal3_1500.calorie = 1500
                meal3_1500.mealID = 6
                meal3_1500.breakfast = "1 cup Soymilk, 0.5 cup (measured when dry) Fortified Oatmeal, 1 cup blueberries"
                meal3_1500.dinner = "0.5 cup Red Beans, w/ 1 tbsp garlic powder, 1tbsp celery, 1 tbsp parsley, 1tsp cumin"
                meal3_1500.lunch = "8 Baby Carrots, 2 tbsp Peanut Butter (natural), 1 tbsp Strawberry Jelly, 2 slices Whole Wheat Bread, 1 cup Soymilk"
                
                let meal1_1800 = MealPlan(context: context)
                meal1_1800.calorie = 1800
                meal1_1800.mealID = 7
                meal1_1800.breakfast = "1 cup Milk (skim), 1 c Strawberries (fresh), 1 Bagel (whole wheat or bran), 0.1 c raisins (seedless)"
                meal1_1800.dinner = ""
                meal1_1800.lunch = "1 cup Cranberry Juice (light), 1 Whole Wheat Pita, 3 oz. Light Tuna (in water), 1 tbsp Mayo (light), 0.25 cup sliced Tomato, 0.2 cup Spinach Leaves (raw)"
                meal1_1800.snack = "1 medium Apple, 0.25 cup whole Almonds"
                
                let meal2_1800 = MealPlan(context: context)
                meal2_1800.calorie = 1800
                meal2_1800.mealID = 8
                meal2_1800.breakfast = "1 cup Milk (skim), 1 c Strawberries (fresh), 1 Bagel (whole wheat or bran), 2 tbsp Cream Cheese (fat free)"
                meal2_1800.dinner = "Soy Burger Patty w/, 1 Whole Wheat Bun, 1 slice tomato"
                meal2_1800.lunch = "1 medium Orange 1 Whole Wheat Pita, 3 oz. Light Tuna (in water), 1 tbsp Mayo (light), 0.25 cup sliced Tomato, 0.2 cup Spinach Leaves (raw)"
                meal1_1800.snack = "1 medium Apple, 0.25 cup whole Almonds"
                
                let meal3_1800 = MealPlan(context: context)
                meal3_1800.calorie = 1800
                meal3_1800.mealID = 9
                meal3_1800.breakfast = "1 cup fortified Bran Flakes, 1 cup Skim or Soymilk (fat free), 1 medium Banana, 0.5 cup Egg Substitute, scrambled"
                meal3_1800.dinner = "0.25 cup fresh Cilantro, 6 Soy ‘Meatballs’ , 1 small Garden Salad (mixed lettuce, tomatoes, carrots), 2 tbsp Salad Dressing (fat free)"
                meal3_1800.lunch = " 1 Whole Wheat Tortilla, 0.2 cup Red Bell Peppers, Green Bell Peppers,  cup Onion, Olive Oil, cup Pinto Beans"
                meal3_1800.snack = "cup Light Vanilla Soymilk, 2 sheets Graham Crackers (low fat)"
                
                appDelegate.saveContext()
            }
            else {
                print("#meals \(meals.count)")
            }
        }
        catch {
            
        }
        let userPreferences = getUserPreferences(userid: Int32(userid))
        
        if userPreferences != nil {
            lunch.text = userPreferences?.lunch
            snack.text = userPreferences?.snack
            breakfast.text = userPreferences?.breakfast
            dinner.text = userPreferences?.dinner
            //print("lunch from DB \(userPreferences?.lunch)")
            
        }
        else {
            breakfast.text = "Grapefruit Wheat skim milk Banana Orange seedless"
            dinner.text = "Potato Carrots Salad Corn Spinach Olive tommato"
            lunch.text = "Carrot Breast Peach Milk Olive Onion"
            snack.text = "Banana Yogurt grapes Butter Apple Almounds Crackers"
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getUserPreferences(userid: Int32) ->  UserPreferences? {
        do {
            let fetchRequest :NSFetchRequest<UserPreferences> =  UserPreferences.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "userID ==%i", userid)
            let result = try context.fetch(fetchRequest)
            /*for object in result{
                context.delete(object)
            }
            appDelegate.saveContext()*/
            if result.count > 0 {
                return result.last
            }
        }
        catch {
            print(error)
        }
        return nil;
    }
    
    @IBAction func SettingsViewController(_ sender: UIButton) {
        var userPreferences = getUserPreferences(userid: Int32(userid))
        if userPreferences == nil {
            userPreferences = UserPreferences(context: context)
        }
        userPreferences?.lunch = lunch.text
        userPreferences?.snack = snack.text
        userPreferences?.breakfast = breakfast.text
        userPreferences?.dinner = dinner.text
        userPreferences?.userID = Int32(userid)
        appDelegate.saveContext()
        
    }
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */
