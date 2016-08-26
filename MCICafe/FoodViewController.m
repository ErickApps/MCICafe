//
//  FoodTableVC.m
//  MCICafe
//
//  Created by Ivan Corchado Ruiz 2/7/15.
//  Copyright (c) 2015 Ivan Corchado Ruiz. All rights reserved.
//

#import "FoodViewController.h"
#import <Parse/Parse.h>

@interface FoodViewController ()

@property NSMutableArray *breakfastArray;
@property NSMutableArray *breakfastPriceArray;
@property NSMutableArray *breakfastDescriptionArray;

@property NSMutableArray *soupSaladArray;
@property NSMutableArray *soupSaladPriceArray;
@property NSMutableArray *soupSaladDescriptionArray;

@property NSMutableArray *sandwichWrapArray;
@property NSMutableArray *sandwichWrapPriceArray;
@property NSMutableArray *sandwichWrapDescriptionArray;

@property (strong, nonatomic) IBOutlet UISegmentedControl *foodSegment;
- (IBAction)changeViewMenu:(id)sender;

@end

@implementation FoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.breakfastArray = [[NSMutableArray alloc] initWithObjects:
                           @"Fruit Cup",
                           @"Yoplait Yogurt",
                           @"Quaker Instant Oatmeal",
                           @"Croissant",
                           @"Ham and Cheese Croissant",
                           @"Chocolate Croissant",
                           @"Bagel (Assorted Flavors)",nil];
    
    self.breakfastPriceArray = [[NSMutableArray alloc] initWithObjects:
                                @"$3.25",
                                @"$1.50",
                                @"$1.99",
                                @"$2.00",
                                @"$2.75",
                                @"$2.25",
                                @"$2.00",nil];
    
    self.breakfastDescriptionArray = [[NSMutableArray alloc] initWithObjects:
                                      @"A cup of delicious fresh fruits from MDC gardens, light and sweet",
                                      @"Packed full of Calcium, great start to you day, light and healthy",
                                      @"A Classic Favorite, warm oatmeal never goes out of style, hearty and filling",
                                      @"As in France, a light, flaky pastry with wonderful buttery flavor, never greasy",
                                      @"A combination of exotic cheeses and classsic hams accompanied by buttery goodness",
                                      @"The decadence of pure chocolate paired with the light flakiness of buttery pastry",
                                      @"Old fashioned favorite, hearty, wholesome, and delicious, perfect anytime",nil];
    
    
    // Soups and Salads
    self.soupSaladArray = [[NSMutableArray alloc] initWithObjects:
                           @"Soup of the Day",
                           @"Large Soup Bowl",
                           @"Spinach Salad",
                           @"Chef's Green Salad",
                           @"Quinoa Salad",
                           @"Seared Tuna Salad",nil];
    self.soupSaladPriceArray = [[NSMutableArray alloc] initWithObjects:
                                @"$3.75",
                                @"$6.50",
                                @"$5.50",
                                @"$6.50",
                                @"$5.50",
                                @"$7.00",nil];
    
    self.soupSaladDescriptionArray = [[NSMutableArray alloc] initWithObjects:
                                      @"Warm, delicious, savory soup, packed with the most wholesome ingredients",
                                      @"A generous sized portion of our world famous soups, served warm and ready to eat",
                                      @"Spinach, Egg, Avocado, Tomato, Balsamic Vinaigrette",
                                      @"Mixed Greens, Egg, Bacon Bits, Tomato, Sliced Turkey, Roasted Poblano Ranch Dressing",
                                      @"Sunflower Seeds, Dried Fruits, Driftwood Vinaigrette, Served on Spring Mixed Greens",
                                      @"Mixed Greens Seared Tuna, Tomato, Red Onion, Green Onion Wasabi Dressing",nil];
    
    // Sandwhiches
    self.sandwichWrapArray = [[NSMutableArray alloc] initWithObjects:
                              @"Turkey Croissant",
                              @"Roasted Carrot Hummus Wrap",
                              @"Caprese Sandwich",
                              @"Greek Salad Sandwich",
                              @"Vegeterian Sandwich",
                              @"Blackened Chicken/Caesar Burrito",
                              @"The Gus",
                              @"Wild Turkey",nil];
    
    self.sandwichWrapPriceArray = [[NSMutableArray alloc] initWithObjects:
                                   @"$6.00",
                                   @"$7.00",
                                   @"$6.50",
                                   @"$8.25",
                                   @"$7.25",
                                   @"$8.00",
                                   @"$6.75",
                                   @"$9.00", nil];
    
    self.sandwichWrapDescriptionArray = [[NSMutableArray alloc] initWithObjects:
                                         @"Sliced Turkey, Hard Cooked Egg, Crispy Bacon, Provologne Cheese",
                                         @"Tortilla, Roasted Carrot Hummus, Roasted Onion, Peppers, Tomato, Feta Cheese",
                                         @"Baguette, Fresh Mozzarella, Roma Tomato, Basil, Balsamic Vinaigrette",
                                         @"Pita Bread, Romaine, Tomato, Onion, Feta Cheese, Olives, Cucumbers, Yogurt Dressing",
                                         @"Baguette, Arugula, Tomato, Carrots, Red Onions , Portabella Mushrooms",
                                         @"Tortilla, Black Beans, Blackened Chicken, Romaine, Smoked Sour Cream Dressing",
                                         @"Chipotle Lime Chicken, Tomato Raisin Chutney Spread, Arugula",
                                         @"Baguette, Roma Tomato, Turkey Breast, Provologne Cheese, Italian Seasoning", nil];
    
    PFObject *pfoFood = [PFObject objectWithClassName:@"Food"];
    pfoFood[@"break_fast_Item"] = self.breakfastArray;
    pfoFood[@"break_fast_Price"] = self.breakfastPriceArray;
    pfoFood[@"break_fast_Description"] = self.breakfastDescriptionArray;
    pfoFood[@"soup_salad_Item_Array"] = self.soupSaladArray;
    pfoFood[@"soup_salad_Price_Array"] = self.soupSaladPriceArray;
    pfoFood[@"soup_salad_Description_Array"] = self.soupSaladDescriptionArray;
    pfoFood[@"sandwich_Wrap_Array"] = self.sandwichWrapArray;
    pfoFood[@"sandwich_Wrap_Price_Array"] = self.sandwichWrapPriceArray;
    pfoFood[@"sandwich_Wrap_Description_Array"] = self.sandwichWrapDescriptionArray;
    
    [pfoFood saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
        } else {
            // There was a problem, check error.description
        }
    }];

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
    if ([_foodSegment selectedSegmentIndex] == 0) {
        return [self.breakfastArray count];
    }
    else if ([_foodSegment selectedSegmentIndex] == 1) {
        return [self.soupSaladArray count];
    }
    else if ([_foodSegment selectedSegmentIndex] == 2) {
        return [self.sandwichWrapArray count];
    }
    else return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"protoCell" forIndexPath:indexPath];
    
    // Configure the cell...
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:100];
    UILabel *priceLabel = (UILabel *)[cell viewWithTag:101];
    UILabel *descriptionLabel = (UILabel *)[cell viewWithTag:102];
    
    if ([_foodSegment selectedSegmentIndex] == 0) {
        titleLabel.text = [self.breakfastArray objectAtIndex:indexPath.row];
        priceLabel.text = [self.breakfastPriceArray objectAtIndex:indexPath.row];
        descriptionLabel.text = [self.breakfastDescriptionArray objectAtIndex:indexPath.row];
    }
    else if ([_foodSegment selectedSegmentIndex] == 1) {
        titleLabel.text = [self.soupSaladArray objectAtIndex:indexPath.row];
        priceLabel.text = [self.soupSaladPriceArray objectAtIndex:indexPath.row];
        descriptionLabel.text = [self.soupSaladDescriptionArray objectAtIndex:indexPath.row];
    }
    else if ([_foodSegment selectedSegmentIndex] == 2) {
        titleLabel.text = [self.sandwichWrapArray objectAtIndex:indexPath.row];
        priceLabel.text = [self.sandwichWrapPriceArray objectAtIndex:indexPath.row];
        descriptionLabel.text = [self.sandwichWrapDescriptionArray objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if ([_foodSegment selectedSegmentIndex] == 0) {
        return @"";
    }
    else if ([_foodSegment selectedSegmentIndex] == 1) {
        return @"";
    }
    else if ([_foodSegment selectedSegmentIndex] == 2) {
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

