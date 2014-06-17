//
//  GameModel.h
//  CardHeroes
//
//  Created by KimSH on 5/30/14.
//  Copyright (c) 2014 COMP420. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayerModel.h"
@interface GameModel : NSObject
@property (strong,nonatomic) PlayerModel *myModel;
@property (strong, nonatomic) PlayerModel *enModel;
@property (strong,nonatomic) NSString *gameName;
@property (nonatomic, assign)NSInteger mySelect;
@property (nonatomic, assign)NSInteger enSelect;
@property (strong, nonatomic) UIImage *beforeMyPortrait;
@property (strong, nonatomic) UIImage *beforeEnPortrait;
@property (nonatomic, assign)NSInteger myAvilCnt;
@property (nonatomic, assign)NSInteger enAvilCnt;
@property (nonatomic, assign)BOOL allEnd;
@property (strong, nonatomic) NSString *recentAction;
-(instancetype)gameInit: (NSInteger)myNum enemy:(NSInteger)enNum;
-(NSInteger)attackProcess;
-(NSInteger)avilityProcess;

@end
