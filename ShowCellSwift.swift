//
//  ShowCellSwift.swift
//  TheGranadaTheaterDallas
//
//  Created by me on 6/23/15.
//  Copyright (c) 2015 me. All rights reserved.
//

import UIKit

class ShowCellSwift: UITableViewCell {
    
    @IBOutlet weak var showActName: UILabel!                        // "actname" in Parse
    @IBOutlet weak var showDate: UILabel!                           // "showdatestring" in Parse
    @IBOutlet weak var showDoors: UILabel!                          // "doors" in Parse
    @IBOutlet weak var showActStyle: UILabel!                       // "actstyle" in Parse
    @IBOutlet weak var showOtherActs: UILabel!                      // "oyheracts" in Parse
    @IBOutlet weak var showActFrom: UILabel!                        // "actfrom" in Parse
    @IBOutlet weak var showActPrice: UILabel!                       // "price" in Parse
    @IBOutlet weak var showActDesciption: UIVerticalAlignLabel!     // "description" in Parse
    @IBOutlet weak var showActImage: UIImageView!
    @IBOutlet weak var buyTicketsButton: UIButton!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        
        
        buyTicketsButton.backgroundColor = UIColor.clearColor()
        buyTicketsButton.layer.cornerRadius = 5
        buyTicketsButton.layer.borderWidth = 1
        buyTicketsButton.layer.borderColor = UIColor.purpleColor().CGColor
        
       
        showActName.textAlignment = NSTextAlignment.Center
        showDate.textAlignment = NSTextAlignment.Center
        showDoors.textAlignment = NSTextAlignment.Center
        showActStyle.textAlignment = NSTextAlignment.Center
        showOtherActs.textAlignment = NSTextAlignment.Center
        showActFrom.textAlignment = NSTextAlignment.Center
        showActPrice.textAlignment = NSTextAlignment.Center
        
      
        
        
               
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder)  {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
    
    
}
