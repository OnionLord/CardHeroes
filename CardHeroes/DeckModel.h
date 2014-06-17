//
//  DeckModel.h
//  CardHeroes
//
//  Created by KimSH on 5/30/14.
//  Copyright (c) 2014 COMP420. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardModel.h"
@interface DeckModel : NSObject
@property (strong,nonatomic) NSMutableArray *cards;

@property (nonatomic, assign) NSInteger myNum;

-(instancetype)init:(NSInteger)num;
@end