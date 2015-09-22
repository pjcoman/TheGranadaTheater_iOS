//
//  GranadaShow.m
//  TheGranadaTheatre
//
//  Created by me on 9/30/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import "GranadaShow.h"

@implementation GranadaShow

- (id) initWithName:(NSString *)actname  {
    self = [super init];
    
    if (self) {
        
        self.actname = actname;
        
        self.actimageurl = nil;
        
    }
    
    return self;
}

+ (id) actWithName:(NSString *)actname  {
    
    return [[self alloc] initWithName:actname];
}

- (NSURL *) imageURL  {
    
    return [NSURL URLWithString:self.actimageurl];
    
}


@end
