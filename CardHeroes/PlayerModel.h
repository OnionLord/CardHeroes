//
//  PlayerModel.h
//  CardHeroes
//
//  Created by KimSH on 5/30/14.
//  Copyright (c) 2014 COMP420. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeckModel.h"
@interface PlayerModel : NSObject
@property (strong, nonatomic) NSString* playerName;
@property (strong, nonatomic) NSString* playerPortrait;
@property (nonatomic, assign) NSInteger playerNum;
@property (strong, nonatomic) DeckModel *playerDeck;
-(instancetype)playerInit:(NSInteger)playNum;
@end
