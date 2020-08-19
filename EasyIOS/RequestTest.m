//
//  RequestTest.m
//  EasyIOS
//
//  Created by 赖盛源 on 2019/9/18.
//  Copyright © 2019 dnake_ay. All rights reserved.
//

#import "RequestTest.h"

@implementation RequestTest

- (void)loadRequest
{
    [super loadRequest];
    
    self.PATH = @"/dk2018/getdevicelist.asp";
    
    self.METHOD = @"GET";
    
    self.acceptableContentTypes = [NSSet setWithObjects:@"application/x-javascript", @"application/json", @"text/json", @"text/javascript", @"text/html", nil];

}

@end
