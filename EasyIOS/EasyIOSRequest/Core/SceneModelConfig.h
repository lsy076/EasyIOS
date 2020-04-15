//
//  SceneModelConfig.h
//  ishanghome
//
//  Created by DNAKE_AY on 17/1/16.
//  Copyright © 2017年 DNAKE_AY. All rights reserved.
//

#import "EasyIOS.h"

@interface SceneModelConfig : SceneModel
//RC4加密
-(NSString *)encrypt:(NSString *)string;
//获取设备唯一标示
+(NSString *)deviceId;

@end
