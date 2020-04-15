//
//  RequestConfig.m
//  ishanghome
//
//  Created by DNAKE_AY on 16/12/5.
//  Copyright © 2016年 DNAKE_AY. All rights reserved.
//

#import "RequestConfig.h"

@implementation RequestConfig

- (void)loadRequest
{
    [super loadRequest];
    
    self.METHOD = @"POST";
    
    self.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", nil];
    
}

@end
