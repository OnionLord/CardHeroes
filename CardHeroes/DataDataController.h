//
//  DataDataController.h
//  CardHeroes
//
//  Created by KimSH on 5/27/14.
//  Copyright (c) 2014 COMP420. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Data;

@interface DataDataController : NSObject

- (NSUInteger)DataCount;
- (Data *)DataAtIndex:(NSUInteger)index;
- (void)addDataWithTitle:(NSString *)title summary:(NSString *)summary campId:(NSString*)campId imgName:(NSString *)imgName content:(NSString *)content type:(NSString *)type;

@end
