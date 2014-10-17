//
//  StationsListViewController.m
//  CodeChallenge3
//
//  Created by Vik Denic on 10/16/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "StationsListViewController.h"
#import "divvyClass.h"

@interface StationsListViewController () <UITabBarDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property NSMutableArray *divvyArray;

@end

@implementation StationsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURL *url = [NSURL URLWithString:@"http://www.divvybikes.com/stations/json/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
        NSMutableArray *results = [jsonDictionary valueForKey:@"stationBeanList"];
        self.divvyArray = [[NSMutableArray alloc] init];

        for (NSDictionary *result in results)
        {
           divvyClass *station = [[divvyClass alloc] initWithJSONData:result];
            [self.divvyArray addObject:station];

            //NSLog tells me the stName is different for each object.  It also tells me that the computational property is working correctly in the class itself.
            NSLog(@"%@",station.stName);
        }
        [self.tableView reloadData];
    }];
}


#pragma mark - UITableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.divvyArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    divvyClass *divvyCell = [self.divvyArray objectAtIndex:indexPath.row];
    cell.textLabel.text = divvyCell.stName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ divvy bikes available", divvyCell.availableBikes];

    //This shows that there are only 7 cells and they now have the same stName in all of them. What?!?!
    NSLog(@"%@", divvyCell.stName);
    return cell;
}

@end




















