//
//  BookSearchTableViewController.m
//  Douban
//
//  Created by 孤岛 on 16/7/20.
//  Copyright © 2016年 孤岛. All rights reserved.
//
#import "NetworkHelper.h"
#import "BookSearchTableViewController.h"
#import "BooksItem.h"
#import "DetailBook.h"
#import "ViewController.h"

@interface BookSearchTableViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBook;
@property (strong,nonatomic) NSMutableArray *searchResults;

@end

@implementation BookSearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBook.delegate = self;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.searchResults = [NSMutableArray array];
    [self.searchBook becomeFirstResponder];
//    self.tableView.tableHeaderView = self.searchBook;
//    self.searchBook.showsScopeBar = NO;
//    [self.searchBook sizeToFit];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//点击搜索结果跳转
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showDetailBook"]) {
        DetailBook *detailbookVC = segue.destinationViewController;
        NSInteger selectindex = [[self.tableView indexPathForSelectedRow]row];
        NSDictionary * dict = [self.searchResults objectAtIndex:selectindex];
        NSString *bookid = [dict objectForKey:@"bookid"];
        detailbookVC.url = [NSString stringWithFormat:@"https://book.douban.com/subject/%@",bookid];
        
        
    }
}
#pragma mark - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    self.searchBook.showsScopeBar = NO;              //点击后取消第一响应
    [self.searchBook sizeToFit];
    [self.searchBook resignFirstResponder];

    NSString * searchText = self.searchBook.text;
    if (searchText.length > 0) {
        NSString * encodeSearchText = [searchText stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSString *URLText = [NSString stringWithFormat:@"book/search?q=%@&limit=20",encodeSearchText];
        [[NetworkHelper SharedHttpManager]GET:URLText parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (responseObject != nil) {
                NSDictionary *dict = responseObject;
                NSArray *booklist = dict[@"books"];
                [self.searchResults removeAllObjects];
                
                [booklist enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    NSDictionary *booksdict = obj;
                    BooksItem * Item = [[BooksItem alloc]init];       //获取名字 ID与作者
                    NSString *bookid = booksdict[@"id"];
                    NSString *bookname = booksdict[@"title"];
                    NSString *authorname = booksdict[@"author"];
                    Item.bookid =bookid;
                    Item.bookname = bookname;
                    Item.author = authorname;
//                     NSLog(@"获取到的作者名是%@",Item.bookname);
                     [self.searchResults addObject:Item]; //将这些信息传给searchResults
                }];
                [self.tableView reloadData];
           }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        }];
    }
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return self.searchResults.count;
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResults.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    BooksItem *Item = self.searchResults[indexPath.row];
    NSString *text = [NSString stringWithFormat:@"%@",Item.bookname];
//    NSString *atext = [NSString stringWithFormat:@"%@",Item.author];
    
    cell.textLabel.text = text;
//    cell.detailTextLabel.text = atext;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
   
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
