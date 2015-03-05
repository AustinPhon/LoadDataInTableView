//
//  SecondViewController.m
//  LoadDataInTableView
//
//  Created by Mobile C&C on 3/5/15.
//  Copyright (c) 2015 XcodeBeginner. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    data = [[NSMutableArray alloc]initWithObjects:
            @"A",@"B",@"C",
            @"D",@"E",@"F",
            @"G",@"H",@"I",
            @"J", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section{
    return [data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSString *stringForCell;
    
    stringForCell= [data objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:stringForCell];
    return cell;
}


#pragma mark - TableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"Section:%d Row:%d selected and its data is %@",
          indexPath.section,indexPath.row,cell.textLabel.text);
    
    NSString *str= [NSString stringWithFormat:@"Section:%d Row:%d selected and its data is %@",
                    indexPath.section,indexPath.row,cell.textLabel.text];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Message" message:str delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];

}

@end
