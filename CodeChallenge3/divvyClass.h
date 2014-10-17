//
//  divvyClass.h
//  CodeChallenge3
//
//  Created by Wade Sellers on 10/17/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface divvyClass : NSObject
@property (readonly) NSString *stName;
@property (readonly) NSString *availableBikes;


-(instancetype)initWithJSONData:(NSDictionary *)jsonData;
@end
