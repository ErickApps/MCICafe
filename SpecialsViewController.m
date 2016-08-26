//
//  SpecialsViewController.m
//  MCICafe
//
//  Created by Erick Barbosa Backend & Ivan Corchado Ruiz Frontend 2/7/15.
//  Copyright (c) 2015 Erick Barbosa Backend & Ivan Corchado Ruiz Frontend. All rights reserved.
//

#import "SpecialsViewController.h"


@interface SpecialsViewController ()


@property NSMutableArray *specialsPriceArray;
@property NSMutableArray *specialsDescriptionArray;
@property NSMutableArray *allObjectsArray;

@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation SpecialsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dateLabel.text = [self getDate];
    
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"protoCell" forIndexPath:indexPath];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Specials"];
    [query getObjectInBackgroundWithId:@"597VGIwWkO" block:^(PFObject *SpecialsOfTheDay, NSError *error) {
        
        
        self.allObjectsArray = [SpecialsOfTheDay objectForKey:@"Specials_OF_The_Day_Array"];
        
        self.specialsPriceArray = [SpecialsOfTheDay objectForKey:@"Specials_Price_Array"];
        
        self.specialsDescriptionArray = [SpecialsOfTheDay objectForKey:@"Specials_Description_Array"];
        
        UILabel *titleLabel = (UILabel *)[cell viewWithTag:105];
        UILabel *descriptionLabel = (UILabel *)[cell viewWithTag:106];
        UILabel *priceLabel = (UILabel *)[cell viewWithTag:107];
        
        
        titleLabel.text =[self.allObjectsArray objectAtIndex:indexPath.row];
        priceLabel.text = [self.specialsPriceArray objectAtIndex:indexPath.row];
        descriptionLabel.text = [self.specialsDescriptionArray objectAtIndex:indexPath.row];
        
    }];

    
    
    
    return cell;
    
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"";
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

//This program is to get the current date in an specific format
-(NSString*)getDate
{
    
    NSDateFormatter* theDateFormatter = [[NSDateFormatter alloc] init];
    [theDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [theDateFormatter setDateFormat:@"EEEE, dd MMM"];
    NSString *weekDay =  [theDateFormatter stringFromDate:[NSDate date]];
    return weekDay;
    
    
}

@end
