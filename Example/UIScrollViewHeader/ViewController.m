//
//  ViewController.m
//  UIScrollViewHeaderExample
//
//  Created by Stian Gudmundsen Høiland on 23.08.2016.
//  Copyright © 2016 Stian Gudmundsen Høiland. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+HeaderView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel *headerLabel = [UILabel new];
    headerLabel.text = @"Header label";
    headerLabel.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.25];
    [headerLabel sizeToFit];
    
    self.textView.headerView = headerLabel;
}

@end
