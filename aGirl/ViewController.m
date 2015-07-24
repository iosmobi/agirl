//
//  ViewController.m
//  aGirl
//
//  Created by Tran Trung Tuyen on 21/07/2015.
//  Copyright (c) Năm 2015 Tran Trung Tuyen. All rights reserved.
//

#import "ViewController.h"
#import "Album.h"
#import "Photo.h"
#import "Catalog.h"
#import "Country.h"
#import "Modelphoto.h"
#import "DetailViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) RLMResults *array;
@property (nonatomic, strong) RLMNotificationToken *notification;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
            

    __weak typeof(self) weakSelf = self;
    self.notification = [RLMRealm.defaultRealm addNotificationBlock:^(NSString *note, RLMRealm *realm) {
        [weakSelf.tableView reloadData];
    }];

    
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
	
	[self setupUI];
	
}

/**
 *  Khởi tạo View
 */
- (void)setupUI
{
	self.array = [[Album allObjects] sortedResultsUsingProperty:@"id" ascending:NO];
	[self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *identifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
	}
	
	
	Album *album = [self.array objectAtIndex:indexPath.row];
	
//    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:album.cover]];

	[cell.imageView sd_setImageWithURL:[NSURL URLWithString:album.cover] placeholderImage:[UIImage imageNamed:@"default_girl"]];
	cell.textLabel.text = album.title;
	
	return cell;
	
}

/**
 *  <#Description#>
 *
 *  @param segue  <#segue description#>
 *  @param sender <#sender description#>
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"toDetail"]) {
		NSIndexPath * indexPath = [self.tableView indexPathForCell:sender];
		DetailViewController *detailVC = segue.destinationViewController;
		detailVC.album = [self.array objectAtIndex:indexPath.row];
		NSLog(@"%ld",(long)indexPath.row);
	}
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    DetailViewController *detailVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"detailVC"];
//    detailVC.album = [self.array objectAtIndex:indexPath.row];
//    [self.navigationController pushViewController:detailVC animated:YES];
//
//}



- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
	
}


//
//- (IBAction)testClick:(id)sender {
//    
//    Country *country = [[Country allObjects] firstObject];
//    NSArray *albums = country.albums;
//    Album *first = [albums firstObject];
//    NSLog(@"%@", first.country.name);
//    
//}
@end
