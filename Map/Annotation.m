//
//  Annotation.m
//  Map
//
//  Created by xcode on 13-6-19.
//  Copyright (c) 2013年 xcode. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation
- (CLLocationCoordinate2D)coordinate
{
    return CLLocationCoordinate2DMake(self.latitude, self.longitude);
}
@end
