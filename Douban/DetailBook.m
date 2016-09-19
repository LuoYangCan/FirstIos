//
//  DetailBook.m
//  Douban
//
//  Created by 孤岛 on 16/7/23. 
//  Copyright © 2016年 孤岛. All rights reserved.
//
#import "BookSearchTableViewController.h"
#import "DetailBook.h"

@interface DetailBook ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *bookurl;

@end

@implementation DetailBook

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bookurl.delegate = self;
    // Do any additional setup after loading the view.
    NSURL *Url1 = [NSURL URLWithString:self.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:Url1];
    [self.bookurl loadRequest:request];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - WebViewDelegate实现
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"Finish");
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    NSLog(@"%@",[error description]);
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
