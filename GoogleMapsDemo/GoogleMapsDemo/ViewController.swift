//
//  ViewController.swift
//  GoogleMapsDemo
//
//  Created by Kenyi Rodriguez on 18/06/16.
//  Copyright © 2016 Core Data Media. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController , GMSMapViewDelegate{

    @IBOutlet weak var mapView: GMSMapView!
    
    var arrayLugares = NSArray()
    
    
    func ajustarZoomMapa(){
        
        var bounds = GMSCoordinateBounds()
        
        self.arrayLugares.enumerateObjectsUsingBlock { (obj, idx, stop) in
            let objBE = obj as! LugarBE
            bounds = bounds.includingCoordinate(CLLocationCoordinate2DMake(objBE.lugar_latitud!.doubleValue, objBE.lugar_longitud!.doubleValue))
        }
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        if appDelegate.locationManager.location != nil {
            bounds = bounds.includingCoordinate(appDelegate.locationManager.location!.coordinate)
        }
        
        self.mapView.animateWithCameraUpdate(GMSCameraUpdate.fitBounds(bounds, withPadding: 0))
    }
    
    func agregarLugares(){
        
        LugarBC.obtenerLugaresConCompletion { (arrayLugares) in
            
            self.arrayLugares = arrayLugares
            
            self.arrayLugares.enumerateObjectsUsingBlock({ (obj, idx, stop) in
                
                let objBE = obj as! LugarBE
                
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2DMake(objBE.lugar_latitud!.doubleValue, objBE.lugar_longitud!.doubleValue)
                marker.title = objBE.lugar_nombre!
                marker.snippet = obj.lugar_nombre!
                marker.icon = UIImage(named:"pin")
                marker.userData = objBE
                marker.map = self.mapView
            })
        }
        
        self.ajustarZoomMapa()
    }
    
    
    func mapView(mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("DetallePinViewController") as! DetallePinViewController
        
        controller.objLugar = marker.userData as? LugarBE
        controller.view.frame = CGRectMake(0, 0, 210, 80)
        
        return controller.view
    }
    
    
    func mapView(mapView: GMSMapView, didTapInfoWindowOfMarker marker: GMSMarker) {
        
        let objLugar = marker.userData as? LugarBE
        
        print("\(objLugar?.lugar_nombre)")
    }
    
    
    override func viewDidLoad() {

        super.viewDidLoad()

        self.mapView.myLocationEnabled = true
        self.mapView.delegate = self
        
        self.agregarLugares()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

