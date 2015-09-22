//
//  ShowsViewControllerParse.h
//  TheGranadaTheaterDallas
//
//  Created by me on 3/6/15.
//  Copyright (c) 2015 me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GranadaShow.h"
#import <Parse/Parse.h>

@interface ShowsViewControllerParse : UITableViewController<UITableViewDelegate>  {
    
    NSArray *showsArray;
}

@property (retain, nonatomic) IBOutlet UITableView *showTableView;


@end
