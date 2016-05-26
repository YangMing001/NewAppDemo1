//
//  BaseTableViewController.m
//  NewAppDemo1
//
//  Created by YM on 16/5/26.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell ;
   
    //先判断是否隐藏
    BOOL needHide3Section = YES;
    if (indexPath.section == 0) {
        cell = [self configCell1ByIndexPath:indexPath];
    }else if (indexPath.section == 1){
        cell = [self configCell2ByIndexPath:indexPath];
    }else if (indexPath.section == 2){
       cell = [self configCell3ByIndexPath:indexPath needHidden:needHide3Section];
    }else{
       cell = [self configCell4ByIndexPath:indexPath];
    }
    
    return cell;
}

//配置第1种样式
- (UITableViewCell *)configCell1ByIndexPath:(NSIndexPath *)indexPath{
     UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
    // do something
    return cell;
}

//配置第2种样式
- (UITableViewCell *)configCell2ByIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
    // do something
    return cell;
}

/**
 *  配置第3种样式
 *
 *  @param indexPath
 *  @param hidden    是否需要隐藏
 *
 */
- (UITableViewCell *)configCell3ByIndexPath:(NSIndexPath *)indexPath needHidden:(BOOL)hidden{
    
    //需要隐藏，直接使用第四种样式配置
    if (hidden) {
        return  [self configCell4ByIndexPath:indexPath];
    }
    
    //否则 正常显示
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
    // do something
    return cell;
}

//配置第四种样式
- (UITableViewCell *)configCell4ByIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
    // do something
    return cell;
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
