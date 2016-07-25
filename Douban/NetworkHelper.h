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
@end
