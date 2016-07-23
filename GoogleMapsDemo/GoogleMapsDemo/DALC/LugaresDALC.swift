//
//  LugaresDALC.swift
//  GoogleMapsDemo
//
//  Created by Kenyi Rodriguez on 18/06/16.
//  Copyright © 2016 Core Data Media. All rights reserved.
//

import UIKit

class LugaresDALC: NSObject {

    class func obtenerLugaresConCompletion(completion : (arrayLugares : NSMutableArray) -> Void){
        
        let path = NSBundle.mainBundle().pathForResource("Lugares", ofType: "plist")
        let array : NSArray = NSArray(contentsOfFile: path!)!
        
        let arrayLugares = NSMutableArray()
        
        array.enumerateObjectsUsingBlock { (obj, idx, stop) in
            
            arrayLugares.addObject(LugarBE.translateLugarBE(obj as! NSDictionary))
        }
        
        completion(arrayLugares: arrayLugares)
        
    }
}
