//
//  LugarBE.swift
//  GoogleMapsDemo
//
//  Created by Kenyi Rodriguez on 18/06/16.
//  Copyright © 2016 Core Data Media. All rights reserved.
//

import UIKit

class LugarBE: NSObject {

    var lugar_latitud   : NSNumber?
    var lugar_longitud  : NSNumber?
    var lugar_nombre    : String?
    var lugar_direccion : String?
    
    class func translateLugarBE(objDic : NSDictionary) -> LugarBE {
        
        let objBE = LugarBE()
        
        objBE.lugar_nombre = objDic["nombre"] as? String
        objBE.lugar_direccion = objDic["direccion"] as? String
        objBE.lugar_latitud = NSNumber(double: objDic["latitud"]!.doubleValue)
        objBE.lugar_longitud = NSNumber(double: objDic["logitud"]!.doubleValue)
        
        return objBE
    }
}
