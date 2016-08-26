//
//  InfoViewController.m
//  MCICafe
//
//  Created by Erick Barbosa Backend & Ivan Corchado Ruiz Frontend 2/7/15.
//  Copyright (c) 2015 Erick Barbosa Backend & Ivan Corchado Ruiz Frontend. All rights reserved.
//

#import "InfoViewController.h"
#import <MapKit/MapKit.h>

@interface InfoViewController () <MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CLLocationCoordinate2D location;
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    
    location.latitude=25.778511;
    location.longitude=-80.190155;
    
    span.latitudeDelta=0.0035;  //or whatever zoom level
    span.longitudeDelta=0.035;
    
    region.span=span;
    region.center=location;
    
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = location;
    point.title = @"MCI Café";
    
    [self.mapView addAnnotation:point];
    [self.mapView selectAnnotation:point animated:YES];
    
    [_mapView setRegion:region animated:TRUE];
    [_mapView regionThatFits:region];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setMapView:(MKMapView *)mapView {
    _mapView = mapView;
    self.mapView.delegate = self;
}

- (IBAction)goToWebsiteLink:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.miamidadeculinary.com"]];
}

- (IBAction)callPhoneNumber:(id)sender {
    [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://3052373276"]];
}

- (IBAction)goToFaceBookLink:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/MiamiCulinaryInstitute"]];
}

- (IBAction)goToTwitterLink:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/MDC_Culinary"]];
}

- (IBAction)goToInstagramLink:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://instagram.com/mcimedia"]];
}

- (IBAction)goToYouTubeLink:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.youtube.com/user/MiamiDadeCulinary"]];
}



@end
