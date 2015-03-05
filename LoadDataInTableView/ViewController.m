//
//  ViewController.m
//  LoadDataInTableView
//
//  Created by Mobile C&C on 3/5/15.
//  Copyright (c) 2015 XcodeBeginner. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tableviewcontroller;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //data    = [[NSMutableArray alloc]initWithObjects:@"A",@"B",@"C", nil];
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
    return [data count]/2;
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
    if (indexPath.section == 0) {
        stringForCell= [data objectAtIndex:indexPath.row];
        
    }
    else if (indexPath.section == 1){
        stringForCell= [data objectAtIndex:indexPath.row+ [data count]/2];
        
    }
    [cell.textLabel setText:stringForCell];
    return cell;
}

// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:
(NSInteger)section{
    NSString *headerTitle;
    if (section==0) {
        headerTitle = @"Section 1 Header";
    }
    else{
        headerTitle = @"Section 2 Header";
        
    }
    return headerTitle;
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:
(NSInteger)section{
    NSString *footerTitle;
    if (section==0) {
        footerTitle = @"Section 1 Footer";
    }
    else{
        footerTitle = @"Section 2 Footer";
        
    }
    return footerTitle;
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
