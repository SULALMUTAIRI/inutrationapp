//
//  MapViewController.swift
//  inutrationapp
//
//  Copyright © 2018 Deakin. All rights reserved.
//

import UIKit
import CoreData
import MapKit
class MapViewController: UIViewController {

    
    @IBOutlet weak var mapview: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(-37.760122, 144.9712)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        mapview.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = "longrain restaurant"
        
        let span2:MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
        let location2:CLLocationCoordinate2D = CLLocationCoordinate2DMake(-37.8754, 144.9750)
        let region2:MKCoordinateRegion = MKCoordinateRegionMake(location2, span2)
        mapview.setRegion(region2, animated: true)
        
        let annotation2 = MKPointAnnotation()
        
        annotation2.coordinate = location2
        annotation2.title = "longrain restaurant"
        
        mapview.addAnnotation(annotation2)
         mapview.addAnnotation(annotation)
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
