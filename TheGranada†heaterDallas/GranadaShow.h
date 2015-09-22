//
//  GranadaShow.h
//  TheGranadaTheatre
//
//  Created by me on 9/30/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GranadaShow : NSObject

@property (nonatomic, strong) NSString *actimageurl;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *showdate;

@property (nonatomic, strong) NSString *otheracts;
@property (nonatomic, strong) NSString *buyticketsurl;
@property (nonatomic, strong) NSString *actstyle;
@property (nonatomic, strong) NSString *actdescription;
@property (nonatomic, strong) NSString *actname;
@property (nonatomic, strong) NSString *wherefrom;



//  Designated Initializer


- (id) initWithName:(NSString *)actname;
+ (id) actWithName:(NSString *)actname;

- (NSURL *) imageURL;



@end
