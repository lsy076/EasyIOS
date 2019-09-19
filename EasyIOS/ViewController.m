//
//  ViewController.m
//  EasyIOS
//
//  Created by 赖盛源 on 2019/9/18.
//  Copyright © 2019 dnake_ay. All rights reserved.
//

#import "ViewController.h"
#import "SceneModelTest.h"

@interface ViewController ()

@property (strong, nonatomic) SceneModelTest *sceneModelTest;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.sceneModelTest = [SceneModelTest SceneModel];
    
    self.sceneModelTest.requestTest.requestNeedActive = YES;
    
    @weakify(self);
    [[RACObserve(self.sceneModelTest.requestTest, state) filter:^BOOL(id value) {
        return YES;
    }] subscribeNext:^(id x) {
        @strongify(self);
        NSLog(@"%@", self);
    }];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        EZLog(@"%@", [URLNavigation navigation].currentViewController);
    });
}


@end
