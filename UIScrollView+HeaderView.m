//
//  UIScrollView+HeaderView.m
//  UIScrollViewHeader
//
//  Created by Stian Gudmundsen Høiland on 23.08.2016.
//  Copyright © 2016 Stian Gudmundsen Høiland. All rights reserved.
//

@import ObjectiveC.runtime;

#import "UIScrollView+HeaderView.h"

@implementation UIScrollView (HeaderView)

- (void)setHeaderView:(UIView *)headerView {
    if ([self isKindOfClass:[UITableView class]]) {
        ((UITableView *)self).tableHeaderView = headerView;
        return;
    }
    
    [self.headerView removeFromSuperview];
    objc_setAssociatedObject(self, @selector(headerView), headerView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setupHeaderView:headerView];
}
- (UIView *)headerView {
    if ([self isKindOfClass:[UITableView class]]) {
        return ((UITableView *)self).tableHeaderView;
    }

    return objc_getAssociatedObject(self, @selector(_cmd));
}
- (void)setupHeaderView:(UIView *)headerView {
    
    headerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:headerView];
    
    NSMutableArray *constraints = [NSMutableArray array];
    
    [constraints addObject:[NSLayoutConstraint constraintWithItem:self
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:headerView
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0
                                                         constant:0]];
    
    [constraints addObject:[NSLayoutConstraint constraintWithItem:self
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:headerView
                                                        attribute:NSLayoutAttributeLeading
                                                       multiplier:1.0
                                                         constant:0]];
    
    [constraints addObject:[NSLayoutConstraint constraintWithItem:self
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:headerView
                                                        attribute:NSLayoutAttributeTrailing
                                                       multiplier:1.0
                                                         constant:0]];
    [NSLayoutConstraint activateConstraints:constraints];
}

@end
