//
//  NetworkHelper.h
//  Douban
//
//  Created by 孤岛 on 16/7/20.
//  Copyright © 2016年 孤岛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface NetworkHelper : NSObject
+ (AFHTTPSessionManager *) SharedHttpManager;
+ (void)placeGetRequest:(NSString *)action withHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))ourBlock ;
@end
