//
//  EntityConfig.m
//  ishanghome
//
//  Created by DNAKE_AY on 16/12/5.
//  Copyright © 2016年 DNAKE_AY. All rights reserved.
//

#import "EntityConfig.h"

@implementation EntityConfig

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"description":@"desc"}];
}

@end
