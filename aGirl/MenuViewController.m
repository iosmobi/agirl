//
//  MenuViewController.m
//  aGirl
//
//  Created by Tran Trung Tuyen on 22/07/2015.
//  Copyright (c) Năm 2015 Tran Trung Tuyen. All rights reserved.
//

#import "MenuViewController.h"
#import "Country.h"
#import "Catalog.h"

@interface MenuViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)close:(id)sender;

@property (nonatomic, strong) RLMResults *countries;
@property (nonatomic, strong) RLMResults *catalogs;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.countries = [Country allObjects];
    self.catalogs = [Catalog allObjects];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [self.catalogs count];
            break;
            
        default:
            return [self.countries count];
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    

    if (indexPath.section == 0) {
        Catalog *c = self.catalogs[indexPath.row];
        cell.textLabel.text = c.name;
    }
    else{
        Country *country = self.countries[indexPath.row];
        cell.textLabel.text = country.name;
    }

    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        NSArray *albums = [self.catalogs[indexPath.row] albums];
        NSLog(@"%ld",[albums count]);
    }
    else
    {
        NSArray *albums = [self.countries[indexPath.row] albums];
        NSLog(@"%ld",[albums count]);

    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
