//
//  ModalViewController.m
//  aGirl
//
//  Created by Tran Trung Tuyen on 21/07/2015.
//  Copyright (c) Năm 2015 Tran Trung Tuyen. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()
{
    Modelphoto *model;
}
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    model = self.album.modelphoto;
    
    self.textView.text = [NSString stringWithFormat:@"%@",model];
    
    NSLog(@"%@",model);
//    NSLog(@"%@",model.albums);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
