//
//  PlayerModel.m
//  CardHeroes
//
//  Created by KimSH on 5/30/14.
//  Copyright (c) 2014 COMP420. All rights reserved.
//

#import "PlayerModel.h"
@implementation PlayerModel
-(instancetype)playerInit:(NSInteger)playNum
{
    NSArray *playerName = @[@"정도전", @"이방원", @"명", @"에에핑크",@"김보성",@"간디"];
    self.playerNum = playNum;
    self.playerName = playerName[self.playerNum - 1];
    self.playerDeck = [[DeckModel alloc]init:self.playerNum];
    self.playerPortrait = [NSString stringWithFormat:@"%d00", self.playerNum];
    return self;
}
@end
