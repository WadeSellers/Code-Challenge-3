//
//  divvyClass.m
//  CodeChallenge3
//
//  Created by Wade Sellers on 10/17/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "divvyClass.h"

@implementation divvyClass
NSDictionary *json;


-(instancetype)initWithJSONData:(NSDictionary *)jsonData{
    self = [super init];
    if(self){
        json = jsonData;

    }
    return self;
}

-(NSString *)stName{
    return json [@"stAddress1"];
}

-(NSString *)availableBikes{
    return json [@"availableBikes"];
}



@end
