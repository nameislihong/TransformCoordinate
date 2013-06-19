//
//  ViewController.m
//  Map
//
//  Created by xcode on 13-6-19.
//  Copyright (c) 2013年 xcode. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "Annotation.h"
#import "TransformCoordinate.h"


@interface ViewController ()<CLLocationManagerDelegate,MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
    [self setMapView:nil];
    [super viewDidUnload];
}

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation
{
    [self.locationManager stopUpdatingLocation];
    
    Annotation *annotation = [[Annotation alloc] init];
    CLLocationCoordinate2D coordinate = transform(newLocation.coordinate.latitude, newLocation.coordinate.longitude);
    annotation.latitude =  /* newLocation.coordinate.latitude; */coordinate.latitude;
    annotation.longitude = /* newLocation.coordinate.longitude; */coordinate.longitude;
    
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView addAnnotation:annotation];
    
    MKCoordinateRegion region;
    region.span = MKCoordinateSpanMake(0.006891, 0.006891);
    region.center = coordinate;
    [self.mapView setRegion:region];
    
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    NSLog(@"定位失败");
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if([annotation isKindOfClass:[MKUserLocation class]]){
        return nil;
    }
    
    static NSString *aid = @"aid";
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:aid];
    
    if(annotationView == nil){
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:aid];
        annotationView.canShowCallout = NO;
        annotationView.pinColor = MKPinAnnotationColorGreen;

    }else{
        annotationView.annotation = annotation;
    }
    
    return annotationView;
}
@end
