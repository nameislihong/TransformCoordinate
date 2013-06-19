//
//  Annotation.h
//  Map
//
//  Created by xcode on 13-6-19.
//  Copyright (c) 2013年 xcode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject<MKAnnotation>
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, assign) 	CLLocationDegrees latitude, longitude;
@end
