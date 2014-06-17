//
//  Data.m
//  CardHeroes
//
//  Created by KimSH on 5/27/14.
//  Copyright (c) 2014 COMP420. All rights reserved.
//

#import "Data.h"

@implementation Data

-(id)initWithTitle:(NSString *)title summary:(NSString *)summary campId:(NSString *)campID imgName:(NSString *)imgName content:(NSString *)content type:(NSString *)type
{
    self = [super init];
    if (self)
    {
        _title = title;
        _summary = summary;
        _campId = campID;
        _imgName = imgName;
        _content = content;
        _type = type;
        return self;
    }
    
    return nil;
}

@end
