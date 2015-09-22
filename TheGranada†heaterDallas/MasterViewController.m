//
//  MasterViewController.m
//  TheGranada†heaterDallas
//
//  Created by me on 12/23/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "CustomCell.h"
#import "GranadaShow.h"

#define IS_IPHONE (!IS_IPAD)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPhone)

@interface MasterViewController ()






@end

@implementation MasterViewController





- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    
    
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    
    NSURL *showsURL = [NSURL URLWithString:@"https://www.kimonolabs.com/api/e423tzey?apikey=8e1ccd6964596e78215834f8b68c4d57"];
    NSData *jsonData = [NSData dataWithContentsOfURL:showsURL];
    
    //   NSLog(@"%@", jsonData);
    NSError *error = nil;
    
    NSDictionary *showsDictionary0 = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    //   NSLog(@"%@", showsDictionary0);
    
    _showsArray = [[NSMutableArray alloc] init];
    self.showsArray = [NSMutableArray array];
    
    NSDictionary *showsDictionary = [showsDictionary0 objectForKey:@"results"];
    
    //   NSLog(@"%@", showsDictionary);
    
    NSArray *individualShowsArray = [showsDictionary objectForKey:@"collection1"];
    
    //  NSLog(@"%@", individualShowsArray);
    
    
    for (NSDictionary *showDictionary in individualShowsArray) {
        
        NSDictionary *field1 = [showDictionary objectForKey:@"actimage"];
        NSDictionary *field5 = [showDictionary objectForKey:@"showlink"];
        NSDictionary *field6 = [showDictionary objectForKey:@"styleofmusic"];
        NSDictionary *field8 = [showDictionary objectForKey:@"actname"];
        
        
        
        GranadaShow *show = [GranadaShow actWithName:[field8 objectForKey:@"text"]];
        show.actimageurl = [field1 objectForKey:@"src"];
        show.price = [showDictionary objectForKey:@"price"];
        
        NSString *showdateraw = [showDictionary objectForKey:@"showdate"];
        NSArray *showdatesplit = [showdateraw componentsSeparatedByString: @" "];
        show.showdate = [showdateraw stringByReplacingOccurrencesOfString:@"|" withString:@""];
        NSDate *now = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"MMMM"];
        NSString *currentmonth = [formatter stringFromDate:now];
        [formatter setDateFormat:@"dd"];
        NSString *currentday = [formatter stringFromDate:now];
        
    //    NSLog(@"Current month is %@", currentmonth);
    //    NSLog(@"Current day is %@", currentday);
        
        show.otheracts = [showDictionary objectForKey:@"otheracts"];
        
        if ([show.otheracts length] == 0)  {
            
            show.otheracts = @"no opening acts";
            
            
        }

        
        
        show.buyticketsurl = [field5 objectForKey:@"href"];
        show.actstyle = [field6 objectForKey:@"text"];
        show.actdescription = [showDictionary objectForKey:@"actdescription"];
        
    //    NSLog(@"%@", show.actname);
    //    NSLog(@"%@", show.actimageurl);
    //    NSLog(@"%@", show.price);
    //    NSLog(@"%@", show.showdate);
        
    //    NSLog(@"%@", showdatesplit[0]);
    //    NSLog(@"Month of show is %@", showdatesplit[1]);
    //    NSLog(@"Day of Show is %@", showdatesplit[2]);
    //    NSLog(@"%@", showdatesplit[3]);
        
    //    NSLog(@"%@", show.otheracts);
    //    NSLog(@"%@", show.buyticketsurl);
    //    NSLog(@"%@", show.actstyle);
    //    NSLog(@"%@", show.actdescription);
        
        int currentdayint = [currentday intValue];
        int dayofshowint = [showdatesplit[2] intValue];
        
        
        
        if (![currentmonth isEqualToString:showdatesplit[1]] || dayofshowint >= currentdayint) {
            
            [self.showsArray addObject:show];
            
            
        }
        
    }

    
    
    
  
    

}



- (void)viewDidAppear:(BOOL)animated  {
    
    [super viewDidAppear:YES];
    

    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_showsArray count];
}










- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    //  NSLog(@"%@", _showsArray);
    
    

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    // Configure the cell...
    
    if (cell == nil) {
        cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    
    GranadaShow *show = [_showsArray objectAtIndex:indexPath.row];
    
    //  if ( [show.actimageurl isKindOfClass:[NSString class]])  {
    
    NSData *imageData = [NSData dataWithContentsOfURL:show.imageURL];
    UIImage *image = [UIImage imageWithData:imageData];
    cell.actimageLabel.image = image;
    
    cell.actnameLabel.text = show.actname;
    
    //   NSLog(@"%@", show.actname);
    
    NSArray *datesplit =[show.showdate componentsSeparatedByString:@"Doors:"];
    NSString *detailtime = [NSString stringWithFormat:@"Doors at%@", datesplit[1]];
    
    
    cell.showdateLabel.text = datesplit[0];
    cell.showdateLabel2.text = detailtime;
    
    if (IS_IPAD)  {
        
        cell.actnameLabel.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:30];
        cell.showdateLabel.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:30];
        cell.showdateLabel2.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:30];
        
        

    }
    
  //     NSLog(@"%@", show.showdate);
    
    
    
    return cell;
    
    

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
 

       
        DetailViewController *dViewController = [[DetailViewController alloc]init];
        dViewController = [segue destinationViewController];
        
         NSIndexPath *indexpath = [self.tableView indexPathForSelectedRow];
        
        GranadaShow *showToPass = [_showsArray objectAtIndex:indexpath.row];
        dViewController.detailname = showToPass.actname;
        dViewController.detaildate = showToPass.showdate;
        dViewController.detailothers = showToPass.otheracts;
        dViewController.detailstyle = showToPass.actstyle;
        dViewController.detaildescription = showToPass.actdescription;
        dViewController.detailprice = showToPass.price;
        dViewController.detailbuyticketsurl = showToPass.buyticketsurl;
        
        
        NSData *imageData = [NSData dataWithContentsOfURL:showToPass.imageURL];
        dViewController.detailimage = [UIImage imageWithData:imageData];
        
        //      NSLog(@"%@", showToPass.actname);
        
        
   


}

@end
