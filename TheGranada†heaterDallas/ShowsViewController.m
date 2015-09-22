//
//  ShowsViewController.m
//  TheGranadaTheaterDallas
//
//  Created by me on 2/12/15.
//  Copyright (c) 2015 me. All rights reserved.
//

#import "ShowsViewController.h"
#import "ShowCell.h"
#import "GranadaShow.h"

#define IS_IPHONE (!IS_IPAD)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPhone)

@interface ShowsViewController()

@end


@implementation ShowsViewController


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
    
    
    
    
    
  
    
    NSURL *showsURL = [NSURL URLWithString:@"https://api.import.io/store/data/a32533dd-9a83-4ec6-8e9f-738b04eb692f/_query?input/webpage/url=http%3A%2F%2Fgranadatheater.com%2Fbuy-tickets%2F&_user=9ee3dbd8-7bc4-4d64-9914-34c3c1d02f71&_apikey=Rxixf5FiXz59vsnPTGmy0oB3wxoxWMZesPYDeGCEqT0JC1Tn1sYTegmUwpgnwYvcCE0xtMOU9HWRPYm9rp%2B7TA%3D%3D"];
    
    
    
    NSData *jsonData = [NSData dataWithContentsOfURL:showsURL];
    
    //   NSLog(@"%@", jsonData);
    NSError *error = nil;
    
    NSDictionary *showsDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    //   NSLog(@"%@", showsDictionary0);
    
    _showsArray = [[NSMutableArray alloc] init];
    self.showsArray = [NSMutableArray array];
    

    
    NSArray *individualShowsArray = [showsDictionary objectForKey:@"results"];
    
    //   NSLog(@"%@", individualShowsArray);
    
    
    for (NSDictionary *showDictionary in individualShowsArray) {
        
   
        
        
        
      
        GranadaShow *show = [GranadaShow actWithName:[showDictionary objectForKey:@"actname"]];
     
        show.actimageurl = [showDictionary objectForKey:@"actimage"];
        show.price = [showDictionary objectForKey:@"price"];
        show.buyticketsurl = [showDictionary objectForKey:@"ticketslink"];
        show.actstyle = [showDictionary objectForKey:@"actstyle"];
        show.actdescription = [showDictionary objectForKey:@"description"];
        show.otheracts = [showDictionary objectForKey:@"otheracts"];
        show.wherefrom = [showDictionary objectForKey:@"actfrom"];
        
        NSString *showdateraw = [showDictionary objectForKey:@"showtime"];
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
        
        
 
        
        
       /*     NSLog(@"%@", show.actname);
            NSLog(@"%@", show.actimageurl);
            NSLog(@"%@", show.price);
            NSLog(@"%@", show.showdate);
        
            NSLog(@"%@", showdatesplit[0]);
            NSLog(@"Month of show is %@", showdatesplit[1]);
            NSLog(@"Day of Show is %@", showdatesplit[2]);
            NSLog(@"%@", showdatesplit[3]);
        
            NSLog(@"%@", show.otheracts);
            NSLog(@"%@", show.buyticketsurl);
        
       */     NSLog(@"%@", show.actstyle);
        NSLog(@"%@", show.wherefrom);
        /*
            NSLog(@"%@", show.actdescription);  */
        
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
    
    ShowCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    //  NSLog(@"%@", _showsArray);
    
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    // Configure the cell...
    
    if (cell == nil) {
        cell = [[ShowCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    
    GranadaShow *show = [_showsArray objectAtIndex:indexPath.row];
    
    //  if ( [show.actimageurl isKindOfClass:[NSString class]])  {
    
    NSData *imageData = [NSData dataWithContentsOfURL:show.imageURL];
    UIImage *image = [UIImage imageWithData:imageData];
    cell.actImage.image = image;
    
    cell.actNameLabel.text = show.actname;
    
    //   NSLog(@"%@", show.actname);
    
    NSArray *datesplit =[show.showdate componentsSeparatedByString:@"Doors:"];
    NSString *detailtime = [NSString stringWithFormat:@"Doors at%@", datesplit[1]];
    
    
    cell.dateLabel.text = datesplit[0];
    cell.dateLabel2.text = detailtime;
    cell.otherActsLabel.text = show.otheracts;
    cell.actStyleLabel.text = show.actstyle;
    cell.showPriceLabel.text = show.price;
    cell.showDescriptionLabel.text = show.actdescription;
    cell.whereFrom.text = show.wherefrom;
    
    
    
    
    cell.buyTicketsButton.tag = indexPath.row;
    
    [cell.buyTicketsButton addTarget:self action:@selector(buyTickets:) forControlEvents:UIControlEventTouchUpInside];
    
    if (IS_IPAD)  {
        
        cell.actNameLabel.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:30];
        cell.dateLabel.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:30];
        cell.dateLabel2.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:30];
        cell.otherActsLabel.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:30];
        cell.actStyleLabel.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:30];
        cell.showPriceLabel.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:30];
        cell.showDescriptionLabel.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:30];
        
        
        
    }
 
 
    
    //     NSLog(@"%@", show.showdate);
    
    
    
    return cell;
    
    
    
}

-(void)buyTickets:(id)sender {
    
    UIButton *senderButton = (UIButton *)sender;
   
        
    NSLog(@"current row=%ld",(long)senderButton.tag);
    
    
    GranadaShow *show = [_showsArray objectAtIndex:senderButton.tag];
    NSString *showUrl = show.buyticketsurl;
    
   NSLog(@"%@", showUrl);
    
    if (showUrl.length != 0)  {
        
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:showUrl]];
        
    }
    

    
    
    
  
    
    
    
}



@end