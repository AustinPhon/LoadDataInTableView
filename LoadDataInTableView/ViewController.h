//
//  ViewController.h
//  LoadDataInTableView
//
//  Created by Mobile C&C on 3/5/15.
//  Copyright (c) 2015 XcodeBeginner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *data;
}

@property (strong, nonatomic) IBOutlet UITableView *tableviewcontroller;

@end

