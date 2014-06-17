//
//  Data.h
//  CardHeroes
//
//  Created by KimSH on 5/27/14.
//  Copyright (c) 2014 COMP420. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *campId;
@property (nonatomic, copy) NSString *imgName;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *type;

-(id)initWithTitle:(NSString *)title summary:(NSString *)summary campId:(NSString*)campID imgName:(NSString *)imgName content:(NSString *)content type:(NSString *)type;

@end
