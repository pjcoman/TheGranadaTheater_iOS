//
//  GranadaShowsTableView.swift
//  TheGranadaTheaterDallas
//
//  Created by me on 6/23/15.
//  Copyright (c) 2015 me. All rights reserved.
//

import UIKit


class GranadaShowsTableView: UITableViewController {
    
    let showObjects: NSMutableArray! = NSMutableArray()
    
    var receivedString:String!
    
    
    
    
       
    
    
  
    
    override func viewDidLoad() {
        
        
        
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "granadarowbg"))
     //  self.tableView.estimatedRowHeight = 400
     //  self.tableView.rowHeight = UITableViewAutomaticDimension
        
      //  allEventsButton!.hidden = true
        
      //  self.tableView.backgroundColor = UIColor.blackColor()
        
        

        
    }
    

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
       
        
        //   self.fetchAllObjectsFromBackground()
        self.fetchAllObjectsFromParse()
        
        tableView.reloadData()
        
        
    }
    
    
    
    func fetchAllObjectsFromParse()  {
        
      
        
        let query: PFQuery = PFQuery(className: "GranadaShows").fromLocalDatastore()
        
        let now = NSDate()
        print(now)
        
        
        
        query.whereKey("showdate", greaterThan: now)
        
        
        switch self.receivedString {
            
            case "All":
                
                 query.orderByAscending("showdate")
            
                
            
            
            case "NEW":
            
                              
              
                let dateMinusTwoWeeks = 2.weeks.ago
                
                
                
                query.whereKey("showdate", greaterThan: now)
                //     query.whereKey("createdAt", greaterThan: dateMinusTwoWeeks!)
                query.orderByDescending("createdAt").whereKey("createdAt", greaterThan: dateMinusTwoWeeks)
                
            
            

            
        default:
            
            query.whereKey("actstyle", containsString: self.receivedString)
            query.orderByAscending("showdate")
          

            

            
         
            
        }
        
        
        
            
        
        
        
        let objects = query.findObjects()
        
        
        for showobject in objects! {
            
            self.showObjects.addObject(showobject)
            
           
            
            
            
        }
        
        
        
        self.tableView.reloadData()
        
            
        
            let showcount = self.showObjects.count
            print("# of shows \(showcount)")
            print(self.receivedString)
            
        
            
        }
        
 
    
    
   

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        _ = self.showObjects.count
     //   println("# of shows \(showcount)")
        
        return self.showObjects.count
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let tempObject: PFObject = self.showObjects.objectAtIndex(indexPath.row) as! PFObject
        let tempString: NSString = (tempObject["description"] as? String)!
        let tempString2: NSString = (tempObject["actname"] as? String)!
        let tempString3: NSString = (tempObject["actstyle"] as? String)!
        let tempString4: NSString = (tempObject["actfrom"] as? String)!
        let tempString5: NSString = (tempObject["price"] as? String)!
        
        
        
        
        print("\(tempString2)")
       
        let tempLength: Int = (tempString as NSString).length
        let tempLength2: Int = (tempString2 as NSString).length
        let tempLength3: Int = (tempString3 as NSString).length
        let tempLength5: Int = (tempString4 as NSString).length
        let tempLength6: Int = (tempString5 as NSString).length
        
        let tempLengthTotal = tempLength + tempLength2 + tempLength3 + tempLength5 + tempLength6
        
        print("\(tempString3)")
        
        print("\(tempLengthTotal)")
       
        
        var customRowHeight: CGFloat
        
        if tempLengthTotal < 220 {
            
            customRowHeight = 420
        
        } else if tempLengthTotal < 240 {
            
            customRowHeight = 440
            
        } else {
        
            customRowHeight = 460
            
        }
        
        return (customRowHeight)
    }
    
    
   
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ShowCellSwift
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        cell.layer.shouldRasterize = true
        
        let object: PFObject = self.showObjects.objectAtIndex(indexPath.row) as! PFObject
        
        //    println(object)
        
        cell.showDate.text = object["showdatestring"] as? String
        cell.showDoors.text = object["doors"] as? String
        
        cell.showActName.text = (object["actname"] as! String)
         
        cell.showActStyle.text = object["actstyle"] as? String
        cell.showOtherActs.text = object["otheracts"] as? String
        cell.showActFrom.text = object["actfrom"] as? String
        cell.showActPrice.text = object["price"] as? String
        cell.showActDesciption.text = object["description"] as? String
        
        let descString: NSString = (object["description"] as? String)!
        let descStringLength = descString.length
        
        print("length of description is \(descStringLength)")
        
        switch descStringLength {
            
        case 0...50:
            cell.showActDesciption.font = UIFont(name: "MarkerFelt-Thin", size: 24)
            print("less than 51")
            
        case 51...140:
            cell.showActDesciption.font = UIFont(name: "MarkerFelt-Thin", size: 21)
            print("less than 141")
        
        default:
            cell.showActDesciption.font = UIFont(name: "MarkerFelt-Thin", size: 18)
            print("more than 141")

            
        }
        
               
        
        let actprice = object["price"] as! String
        
        
        
        
        ImageLoader.sharedLoader.imageForUrl((object["actimage"] as? String)!, completionHandler: {(image: UIImage?, url: String) in cell.showActImage.image = image!})
        
        
        
        
        
        
        cell.showActImage.layer.cornerRadius = 10
        cell.showActImage.clipsToBounds = true
        
        
        
        
        switch actprice  {
            case "FREE":
            
                    print("FREE")
            
                    //  cell.buyTicketsButton.hidden = true
            
                    let imageBuyTicketsFreeOrSoldOut = UIImage(named: "buytickets_soldout") as UIImage!
            
                    cell.buyTicketsButton.setImage(imageBuyTicketsFreeOrSoldOut, forState: .Normal)
        case "SOLD OUT":
                    print("SOLD OUT")
        
                    //  cell.buyTicketsButton.hidden = true
        
                    let imageBuyTicketsFreeOrSoldOut = UIImage(named: "buytickets_soldout") as UIImage!
        
                    cell.buyTicketsButton.setImage(imageBuyTicketsFreeOrSoldOut, forState: .Normal)
            
        case "?":
                    print("PRICE UNDETERMINED")
            
                    //  cell.buyTicketsButton.hidden = true
            
                    let imageBuyTicketsFreeOrSoldOut = UIImage(named: "buytickets_soldout") as UIImage!
            
                    cell.buyTicketsButton.setImage(imageBuyTicketsFreeOrSoldOut, forState: .Normal)
            
        case "":
                    print("PRICE UNDETERMINED")
            
                    //  cell.buyTicketsButton.hidden = true
            
                    let imageBuyTicketsFreeOrSoldOut = UIImage(named: "buytickets_soldout") as UIImage!
            
                       cell.buyTicketsButton.setImage(imageBuyTicketsFreeOrSoldOut, forState: .Normal)
            
        default:
            
            let imageBuyTickets = UIImage(named: "buyticketsbuttonwithtext120_128") as UIImage!
         //   cell.buyTicketsButton.setBackgroundImage(imageBuyTickets, forState: .Normal)
            cell.buyTicketsButton.setImage(imageBuyTickets, forState: .Normal)
            
            
            

        }
        
        
        
        
        
        cell.buyTicketsButton.tag = indexPath.row
        
        cell.buyTicketsButton .addTarget(self, action: "buyTickets:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        
        
        
        cell.layoutIfNeeded()
        
        
        
        
        return cell
        
    }
    
    func configureTableView() {
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 440
        
        
    }
    
    
    @IBAction func buyTickets(sender: UIButton) {
        
            print(sender.tag)
        
            let object: PFObject = self.showObjects.objectAtIndex(sender.tag) as! PFObject
        
            print(object)
        
            let url = object["ticketslink"] as? String
        
        if ( url != nil) {
        
        UIApplication.sharedApplication().openURL(NSURL(string: url!)!)
            
        }
        
        
        
        
        
        
        
    }
    
          
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    





