//
//  DinksViewController.m
//  MCICafe
//
//  Created by Ivan Corchado Ruiz 2/7/15.
//  Copyright (c) 2015 Ivan Corchado Ruiz. All rights reserved.
//

#import "DinksViewController.h"
#import <Parse/Parse.h>
@interface DinksViewController ()

@property NSMutableArray *coffeeArray;
@property NSMutableArray *coffeePriceArray;

@property NSMutableArray *specialsArray;
@property NSMutableArray *sodasPriceArray;

@property (strong, nonatomic) IBOutlet UISegmentedControl *drinkSegment;
- (IBAction)changeViewMenu:(id)sender;

@end

@implementation DinksViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Coffee
    self.coffeeArray = [[NSMutableArray alloc] initWithObjects:
                        @"Coffee", //1
                        @"Café con Leche", //2
                        @"Latte", //3
                        @"Caramel Latte", //4
                        @"Seasonal Latte", //5
                        @"Vanilla Latte", //6
                        @"Iced Vanilla Latte", //7
                        @"Iced Caramel Latte", //8
                        @"Iced Mocha", //9
                        @"Cappuccino", //10
                        @"Machiatto", //11
                        @"Cortadito", //12
                        @"Espresso", //13
                        @"Add Soymilk",nil]; //14
    
    self.coffeePriceArray = [[NSMutableArray alloc] initWithObjects:
                        @"S $1.95 - L $2.50", //1
                        @"S $2.80 - L $3.25", //2
                        @"S $2.80 - L $3.25", //3
                        @"S $3.35 - L $3.85", //4
                        @"S $3.35 - L $3.85", //5
                        @"S $3.35 - L $3.85", //6
                        @"$3.50", //7
                        @"$3.50", //8
                        @"$3.50", //9
                        @"$2.50", //10
                        @"$2.25", //11
                        @"$2.25", //12
                        @"$2.00", //13
                        @"$0.50",nil]; //14
    
    // Sodas
    self.specialsArray = [[NSMutableArray alloc] initWithObjects:
                        @"Hot Chocolate", //1
                        @"Hot Tea", //2
                        @"Bottled Water", //3
                        @"Sodas", //4
                        @"Izzy Juice",  //5
                        @"Odwalla Smoothie", //6
                        @"Naked Juice",  //7
                        @"Pure Leaf Iced Tea", //8
                        @"Sabra Hummus", //9
                        @"Orange Juice", //10
                        @"Apple Juice",  //11
                        @"Coconut Water", //12
                        @"Gatorade",nil]; //13
    
    self.sodasPriceArray = [[NSMutableArray alloc] initWithObjects:
                            @"$3.00", //1
                            @"$1.50", //2
                            @"$1.50", //3
                            @"$1.25", //4
                            @"$2.50", //5
                            @"$3.25", //6
                            @"$3.75", //7
                            @"$2.50", //8
                            @"$3.25", //9
                            @"$2.50", //10
                            @"$1.75", //11
                            @"$2.25", //12
                            @"$2.25",nil]; //13
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
    if ([_drinkSegment selectedSegmentIndex] == 0) {
        return [self.coffeeArray count];
    }
    else if ([_drinkSegment selectedSegmentIndex] == 1) {
        return [self.specialsArray count];
    }
    else return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"protoCell" forIndexPath:indexPath];

    UILabel *titleLabel = (UILabel *)[cell viewWithTag:100];
    UILabel *priceLabel = (UILabel *)[cell viewWithTag:101];
    
    if ([_drinkSegment selectedSegmentIndex] == 0) {
        titleLabel.text = [self.coffeeArray objectAtIndex:indexPath.row];
        priceLabel.text = [self.coffeePriceArray objectAtIndex:indexPath.row];
    }
    else if ([_drinkSegment selectedSegmentIndex] == 1) {
        titleLabel.text = [self.specialsArray objectAtIndex:indexPath.row];
        priceLabel.text = [self.sodasPriceArray objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if ([_drinkSegment selectedSegmentIndex] == 0) {
        return @"";
    }
    else if ([_drinkSegment selectedSegmentIndex] == 1) {
        return @"";
    }
    else return @"";
    
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

- (IBAction)changeViewMenu:(id)sender {
    [self.tableView reloadData];
}
@end

