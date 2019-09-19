//
//  SceneModelTest.m
//  EasyIOS
//
//  Created by 赖盛源 on 2019/9/18.
//  Copyright © 2019 dnake_ay. All rights reserved.
//

#import "SceneModelTest.h"

@implementation SceneModelTest

- (void)loadSceneModel
{
    [super loadSceneModel];
    
    self.requestTest = [RequestTest Request];
    
    @weakify(self);
    self.requestTest.requestInActiveBlock = ^{
        @strongify(self);
        [self SEND_ACTION:self.requestTest];
    };
}

@end
