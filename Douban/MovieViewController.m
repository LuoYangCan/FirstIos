//
//  MovieViewController.m
//  Douban
//
//  Created by 孤岛 on 16/8/4.
//  Copyright © 2016年 孤岛. All rights reserved.
//

#import "MovieViewController.h"

@interface MovieViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *MovieWeb;
@property (weak,nonatomic) NSString *URLText;
@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.URLText = @"https://movie.douban.com/";
    // Do any additional setup after loading the view.
    self.MovieWeb.delegate = self;
    NSURL *URL = [NSURL URLWithString:self.URLText];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    [self.MovieWeb loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
