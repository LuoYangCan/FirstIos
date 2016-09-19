//
//  movieSearch.m
//  Douban
//
//  Created by 孤岛 on 16/9/6.
//  Copyright © 2016年 孤岛. All rights reserved.
//
#import "NetworkHelper.h"
#import "movieSearch.h"

@interface movieSearch ()<UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchbar;
@property (weak, nonatomic) IBOutlet UITableViewCell *MovieCell;

@end

@implementation movieSearch

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//#pragma mark - UIsearchBarDelegate
//- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
//    NSError *error;
//    if (self.searchbar.text > 0) {
//        NSString *text =  self.searchbar.text;
//        [NetworkHelper placeGetRequest:text withHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//            data = [NSURLConnection sendSynchronousRequest:<#(nonnull NSURLRequest *)#> returningResponse:<#(NSURLResponse *__autoreleasing  _Nullable * _Nullable)#> error:<#(NSError * _Nullable __autoreleasing * _Nullable)#>]
//        }]
//        NSURLRequest *request = [NSURLRequest requestWithURL: [NSURL URLWithString:codetext]];
//        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//        
//    }
//
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
