//
//  containsStringExtension.swift
//  TheGranadaTheaterDallas
//
//  Created by me on 9/18/15.
//  Copyright © 2015 me. All rights reserved.
//

import Foundation

extension String {
    
    func contains(substr: String) -> Bool {
        
        if #available(iOS 8, *) {
            
            return NSString(string: self).containsString(substr)
            
        } else {
            
            return self.rangeOfString(substr) != nil
        }
        
    }
    
}
