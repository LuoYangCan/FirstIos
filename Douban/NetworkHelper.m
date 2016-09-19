//
//  NetworkHelper.m
//  Douban
//
//  Created by 孤岛 on 16/7/20.
//  Copyright © 2016年 孤岛. All rights reserved.
//

#import "NetworkHelper.h"
static NSString *const DoubanAPI = @"https://api.douban.com/v2/";
@implementation NetworkHelper

+ (AFHTTPSessionManager *) SharedHttpManager{
    static AFHTTPSessionManager * _sharedClient = nil;
    static dispatch_once_t OnceToken;
    dispatch_once(&OnceToken, ^{
        _sharedClient = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:DoubanAPI]];
    });
    return _sharedClient;
}
+ (void)placeGetRequest:(NSString *)action withHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))ourBlock {
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.douban.com/v2/movie/search?q=%@", action];
    
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:ourBlock] resume];
}
@end
