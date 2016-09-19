//
//  ViewController.m
//  Douban
//
//  Created by 孤岛 on 16/7/20.
//  Copyright © 2016年 孤岛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *BookWeb;
@property (weak,nonatomic) NSString *URLText;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.URLText = @"https://book.douban.com/";
    // Do any additional setup after loading the view, typically from a nib.
    self.BookWeb.delegate = self;
    NSURL *URL = [NSURL URLWithString:self.URLText];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    [self.BookWeb loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)DoubanMovie:(id)sender {
}

- (IBAction)Goback:(id)sender {
    if (self.BookWeb.canGoBack) {
        [self.BookWeb goBack];

    }
}

- (IBAction)Refresh:(id)sender {
    [self.BookWeb reload];
}

@end
