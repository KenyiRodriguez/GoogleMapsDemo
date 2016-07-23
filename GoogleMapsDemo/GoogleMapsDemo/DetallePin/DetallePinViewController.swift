//
//  DetallePinViewController.swift
//  GoogleMapsDemo
//
//  Created by Kenyi Rodriguez on 18/06/16.
//  Copyright © 2016 Core Data Media. All rights reserved.
//

import UIKit

class DetallePinViewController: UIViewController {
    
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblSubTitulo : UILabel!
    
    
    var objLugar : LugarBE?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let radio : CGFloat = 10.0;
        let altoFlecha : CGFloat = 10.0;
        let ancho : CGFloat = 210.0;
        let alto : CGFloat = 80.0;
        
        let path = CGPathCreateMutable();
        
        CGPathMoveToPoint(path, nil,0 , radio);
        CGPathAddArcToPoint(path, nil, 0, 0, radio, 0, radio);
        CGPathAddLineToPoint(path, nil, ancho - radio, 0);
        CGPathAddArcToPoint(path, nil, ancho, 0, ancho, radio, radio);
        CGPathAddLineToPoint(path, nil, ancho, alto - altoFlecha - radio);
        CGPathAddArcToPoint(path, nil, ancho, alto - altoFlecha, ancho - radio, alto - altoFlecha, radio);
        CGPathAddLineToPoint(path, nil, ancho / 2 + altoFlecha, alto - altoFlecha);
        CGPathAddArcToPoint(path, nil, ancho / 2, alto, ancho / 2 - altoFlecha, alto - altoFlecha, radio);
        CGPathAddLineToPoint(path, nil, ancho / 2 - altoFlecha, alto - altoFlecha);
        CGPathAddLineToPoint(path, nil, radio, alto - altoFlecha);
        CGPathAddArcToPoint(path, nil, 0, alto - altoFlecha, 0, alto - altoFlecha - radio, radio);
        
        CGPathCloseSubpath(path);
        
        let mask = CAShapeLayer()
        
        mask.bounds = self.view.bounds
        mask.strokeColor = UIColor.redColor().CGColor;
        mask.position = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
        mask.path = path
        
        self.view.layer.mask = mask;
    }
    
    override func viewDidAppear(animated: Bool) {
        
        self.lblTitulo.text = self.objLugar!.lugar_nombre!
        self.lblSubTitulo.text = self.objLugar!.lugar_direccion!
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
