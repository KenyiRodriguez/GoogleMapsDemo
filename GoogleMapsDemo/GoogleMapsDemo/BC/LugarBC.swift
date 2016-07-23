//
//  LugarBC.swift
//  GoogleMapsDemo
//
//  Created by Kenyi Rodriguez on 18/06/16.
//  Copyright © 2016 Core Data Media. All rights reserved.
//

import UIKit

class LugarBC: NSObject {

    class func obtenerLugaresConCompletion(completion : (arrayLugares : NSArray) -> Void){
        
        LugaresDALC.obtenerLugaresConCompletion { (arrayLugares) in
            completion(arrayLugares: arrayLugares)
        }
    }
}
