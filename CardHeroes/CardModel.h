//
//  CardModel.h
//  CardHeroes
//
//  Created by KimSH on 5/30/14.
//  Copyright (c) 2014 COMP420. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardModel : NSObject
@property (nonatomic, assign) NSInteger unitHealth;
@property (nonatomic, assign) NSInteger unitHealthNow;
@property (nonatomic, assign) NSInteger unitAttack;
@property (nonatomic, assign) NSInteger unitTier;
@property (strong, nonatomic) NSString* unitName;
@property (nonatomic, assign) NSInteger playerNum;
@property (strong,nonatomic) NSString * imgNum;

-(instancetype) init:(NSInteger) health attack:(NSInteger)attack name: (NSString*) name tier:(NSInteger)tier num:(NSInteger)num;
@end


