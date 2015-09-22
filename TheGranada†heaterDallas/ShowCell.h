//
//  ShowCell.h
//  TheGranadaTheaterDallas
//
//  Created by me on 2/12/15.
//  Copyright (c) 2015 me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GranadaShow.h"


@interface ShowCell : UITableViewCell



@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel2;
@property (weak, nonatomic) IBOutlet UIImageView *actImage;
@property (weak, nonatomic) IBOutlet UILabel *actNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *otherActsLabel;
@property (weak, nonatomic) IBOutlet UILabel *actStyleLabel;
@property (weak, nonatomic) IBOutlet UILabel *showPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *showDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *whereFrom;
@property (weak, nonatomic) IBOutlet UIButton *buyTicketsButton;






@property (nonatomic, strong) NSString *detailwherefrom;
@property (nonatomic, strong) UIImage *detailimage;
@property (nonatomic, strong) NSString *detaildate;
@property (nonatomic, strong) NSString *detailname;
@property (nonatomic, strong) NSString *detailothers;
@property (nonatomic, strong) NSString *detailstyle;
@property (nonatomic, strong) NSString *detailprice;
@property (nonatomic, strong) NSString *detaildescription;
@property (nonatomic, strong) NSString *detailbuyticketsurl;


@end

