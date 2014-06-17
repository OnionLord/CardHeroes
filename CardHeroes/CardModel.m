//
//  CardModel.m
//  CardHeroes
//
//  Created by KimSH on 5/30/14.
//  Copyright (c) 2014 COMP420. All rights reserved.
//

#import "CardModel.h"

@implementation CardModel

-(instancetype) init:(NSInteger) health attack:(NSInteger)attack name: (NSString*) name tier:(NSInteger)tier num:(NSInteger)num
{
    self.unitHealth = self.unitHealthNow = health;
    self.unitAttack = attack;
    self.unitName = name;
    self.playerNum = num;
    self.unitTier = tier;
    self.imgNum = [NSString stringWithFormat:@"%d%d0",num,tier];
    return self;
}

@end

