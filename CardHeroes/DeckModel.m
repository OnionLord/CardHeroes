//
//  DeckModel.m
//  CardHeroes
//
//  Created by KimSH on 5/30/14.
//  Copyright (c) 2014 COMP420. All rights reserved.
//

#import "DeckModel.h"
#import "CardModel.h"

@interface DeckModel()
@end



@implementation DeckModel




-(instancetype)init:(NSInteger)num
{
    int i;
    self.cards = [[NSMutableArray alloc] init];
    NSArray *names;
    NSInteger healths[7] = { 7,6,4,3,4,2,2};
    NSInteger attack[7] = {7,4,6,2,2,4,3};
    switch(num)
    {
        case 1:
            names = @[@"정도전", @"남은", @"은둔자", @"윤소종",@"방패병",@"군단병",@"화승총병",@"궁병"];
            break;
        case 2:
            names = @[@"이방원", @"조영규", @"이숙번", @"하륜",@"광전사",@"기병",@"화승총병",@"궁병"];
            healths[0] = 6;
            healths[1] = 5;
            healths[2] = 4;
            healths[3] = 2;
            healths[4] = 2;
            healths[5] = 2;
            healths[6] = 2;
            attack[0] = 7;
            attack[1] = 6;
            attack[2] = 6;
            attack[3] = 4;
            attack[4] = 4;
            attack[5] = 3;
            attack[6] = 3;
            break;
        case 3:
            names = @[@"명", @"친위대장", @"환관무사", @"서역용병",@"궁병",@"중갑병",@"창병",@"수도승"];
            healths[0] = 7;
            healths[1] = 6;
            healths[2] = 6;
            healths[3] = 4;
            healths[4] = 3;
            healths[5] = 3;
            healths[6] = 3;
            attack[0] = 6;
            attack[1] = 5;
            attack[2] = 4;
            attack[3] = 2;
            attack[4] = 2;
            attack[5] = 2;
            attack[6] = 2;
            break;
        case 4:
            names = @[@"에이핑크", @"손나은", @"정은지", @"김남주",@"윤보미",@"박초롱",@"오하영",@"이지은"];
            healths[0] = 5;
            healths[1] = 3;
            healths[2] = 4;
            healths[3] = 6;
            healths[4] = 2;
            healths[5] = 3;
            healths[6] = 2;
            attack[0] = 3;
            attack[1] = 5;
            attack[2] = 4;
            attack[3] = 2;
            attack[4] = 6;
            attack[5] = 5;
            attack[6] = 6;
            break;
        case 5:
            names = @[@"김보성", @"티리엘", @"하연수", @"스파르타",@"니코벨릭",@"상하이조",@"신돈",@"너고소"];
            healths[0] = 7;
            healths[1] = 6;
            healths[2] = 6;
            healths[3] = 4;
            healths[4] = 3;
            healths[5] = 3;
            healths[6] = 3;
            attack[0] = 6;
            attack[1] = 5;
            attack[2] = 4;
            attack[3] = 2;
            attack[4] = 2;
            attack[5] = 2;
            attack[6] = 2;
            break;
        case 6:
            names = @[@"간디", @"관대하", @"홍진호", @"옥수수맨",@"수지",@"도바킨",@"달러멘디",@"코끼리"];
            healths[0] = 6;
            healths[1] = 5;
            healths[2] = 4;
            healths[3] = 2;
            healths[4] = 2;
            healths[5] = 2;
            healths[6] = 2;
            attack[0] = 7;
            attack[1] = 6;
            attack[2] = 6;
            attack[3] = 4;
            attack[4] = 4;
            attack[5] = 3;
            attack[6] = 3;
            break;
        default:
           names = @[@"정도전", @"남은", @"은둔자", @"윤소종",@"방패병",@"군단병",@"화승총병",@"궁병"];
    }
    
    for ( i = 1 ; i <= 7 ; i ++)
    {
        CardModel *inputCard = nil;
        inputCard = [[CardModel alloc] init:healths[i-1] attack:attack[i-1] name:names[i] tier:i num:1];
        [self.cards addObject:inputCard];
    }
    
    
    
    return self;
}
@end
