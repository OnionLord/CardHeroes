//
//  GameModel.m
//  CardHeroes
//
//  Created by KimSH on 5/30/14.
//  Copyright (c) 2014 COMP420. All rights reserved.
//



#import "GameModel.h"
@interface GameModel()
@property (nonatomic,assign) NSInteger myDeathCnt;
@property (nonatomic,assign) NSInteger enDeathCnt;

@end

//정도전 균형 -> 부활 or 전체 회복 1회
//이방원 공격 -> 공격강화(+2) 2회
//명나라 방어 -> 방어강화(+2) 2회
//에이핑크 균등 -> 균형강화(+1)(+1) 2회



@implementation GameModel

-(instancetype)gameInit:(NSInteger)myNum enemy:(NSInteger)enNum
{
    self.allEnd = NO;
    self.mySelect = -1;
    self.enSelect = -1;
    self.myDeathCnt = 0;
    self.enDeathCnt = 0;
    self.myModel = [[PlayerModel alloc] playerInit:myNum];
    self.enModel =[[PlayerModel alloc] playerInit:enNum];
    
    self.gameName = @"Historical Battle";
    
    switch(self.myModel.playerNum)
    {
        case 1:
        case 5:
            self.myAvilCnt = 1;
            break;
        case 2:
        case 6:
            self.myAvilCnt = 3;
            break;
        case 3:
            self.myAvilCnt = 3;
            break;
        case 4:
            self.myAvilCnt = 3;
            break;
        default:break;
    }
    
    switch(self.enModel.playerNum)
    {
        case 1:
        case 5:
            self.enAvilCnt = 1;
            break;
        case 2:
        case 6:
            self.enAvilCnt = 3;
            break;
        case 3:
            self.enAvilCnt = 3;
            break;
        case 4:
            self.enAvilCnt = 3;
            break;
        default:break;
    }
   // NSLog(@"%d%d",self.myAvilCnt, self.enAvilCnt);
    if(myNum==1)
    {
        if(enNum == 2)
        {
            self.gameName = @"제 1차 왕자의 난";
            UIAlertView *sureToExit = [[UIAlertView alloc]initWithTitle:@"제 1차 왕자의 난" message:@"새 나라가 건국된지도 어언 6년째인 무인년, 정안군 이방원은 세자첵봉 문제에 관해 불만을 품고 삼봉 당신을 포함한 자신이 아닌 다른 세자를 세우려는 자들을 무참히 죽이고 있소. 이리저리 날뛰는 정안군을 막을자는 삼봉 당신 뿐이오." delegate:self cancelButtonTitle:@"Start" otherButtonTitles:nil, nil];
            [sureToExit show];
        }
        else if(enNum == 3)
        {
            self.gameName = @"요동 정벌";
            UIAlertView *sureToExit = [[UIAlertView alloc]initWithTitle:@"요동 정벌" message:@"위화도 회군이 일어났던 때를 기억하시오? 그때 삼봉은 지금의 고려로써는 명나라를 치기가 불가능하다 라고 하셨소. 다른 사대부들은 쳐서는 안된다고 한것도 기억나오. 그 차이가 무엇인지 감이 잡히지 않았으나 오늘에서야 그 감이 잡히는구려. 옛 조상들이 보기에 부끄럽지 않게 해주시오! 감히 명나라 따위가 우리 대 조선국을 업신여기지 못하게 제대로 혼을 내 주시오." delegate:self cancelButtonTitle:@"Start" otherButtonTitles:nil, nil];
            [sureToExit show];
        }
    }
    else if(myNum == 2)
    {
        if(enNum == 1)
        {
            self.gameName = @"제 1차 왕자의 난";
            UIAlertView *sureToExit = [[UIAlertView alloc]initWithTitle:@"제 1차 왕자의 난" message:@"아바마마께서는 이 나라를 건국하는 과정에서도 계속 우유부한하셨다. 포은이 대업에 방해가 되는걸 아는지 모르는지 계속 포은과 삼봉 둘다 가지시려 하셨다. 하지만 나는 과감히 새 나라를 새우는데 방해되는 포은을 제거하였다. 그리고 내 손을 거쳐 새 나라가 세워졌다. 그런데 어마마마의 첫째 아들도 아닌 막내아들을 세자로 세우는건가 그 모자란 자식을? 삼봉숙부를 포함한 공신들은 더 힘을 얻고 왕실은 힘을 잃어가고 있다. 이대로는 아니된다. 반드시 바로잡아야 한다." delegate:self cancelButtonTitle:@"Start" otherButtonTitles:nil, nil];
            [sureToExit show];
        }
        
    }
    else if(myNum == 3)
    {
        if(enNum == 1)
        {
            self.gameName = @"요동 정벌";
            UIAlertView *sureToExit = [[UIAlertView alloc]initWithTitle:@"요동 정벌" message:@"나름 우리 대명제국에게 사대를 강하게 주장하던 정도전이 감히 우리 대명제국을 공격하기로 하였다. 조선 건국후 골칫거리가 될 줄은 알았다만 설마가 사실이 될 줄이야. 대명제국의 천자로써 정도전에게 반드시 깊고 어두운 환상을 보여주고 말 것이다! 정도전 개자식아 이리오너라 시작하자!" delegate:self cancelButtonTitle:@"Start" otherButtonTitles:nil, nil];
            [sureToExit show];
        }
    }
    else if(myNum == 5)
    {
        if(enNum == 6)
        {
            self.gameName = @"의리의 땅 수호";
            UIAlertView *sureToExit = [[UIAlertView alloc]initWithTitle:@"의리의 땅 수호" message:@"의리따위는 눈꼽따위 만큼 없는 간디가 연합군을 이끌고 우리 의리가 넘치는 땅을 차지하려고 한다. 전 세계 문명중에서 가장 정복욕이 강한 문명의 지도자인 간디는 이미 그 악명이 전 문명권으로 퍼져있다. 의리의 땅이 그렇게 먹고 싶었는지 자신의 주력군인 옥수수를 무기로 하는 거인 옥수수맨을 원정군에 포함시켰고, 스카이림 지방의 전설의 전사로 불리는 도바킨(Dovahkiin)을 고용하고 이웃 문명인 페릇시아의 지도자 관대하와 동맹을 맺었다. 이번 전쟁은 많이 힘들것 같다. 하지만 우리들의 의리로 반드시 이겨내고 말테다!" delegate:self cancelButtonTitle:@"Start" otherButtonTitles:nil, nil];
            [sureToExit show];
        }
    }
    else if(myNum == 6)
    {
        if(enNum == 5)
        {
            self.gameName = @"의리의 땅 원정";
            UIAlertView *sureToExit = [[UIAlertView alloc]initWithTitle:@"의리의 땅 원정" message:@"의리를 내세우는 김보성이라는 놈이 요즘 많이 나대고 있다. 의리사상의 파급력이 큰지 우리 문명의 백성들도 이웃 페르시아의 백성들도 의리를 갈망하고 있다. 나 대 인도문명의 지도자 간디, 이 거슬리는 의리를 물리치고 황금같은 땅 의리의 땅을 반드시 차지하고 말테다! 한동한 힘을 못써서 정말 지루했다. 패왕 간디가 무엇인지 제대로 보여주겠다!" delegate:self cancelButtonTitle:@"Start" otherButtonTitles:nil, nil];
            [sureToExit show];
        }
    }
    return self;
}
-(NSInteger)attackProcess
{
    NSString *myAction=@"", *die1=@"", *die2=@"", *enAction=@"", *die3=@"", *die4=@"";
    CardModel *mycard = [self.myModel.playerDeck.cards objectAtIndex:self.mySelect];
    CardModel *encard = [self.enModel.playerDeck.cards objectAtIndex:self.enSelect];
    
    mycard.unitHealthNow -= encard.unitAttack;
    encard.unitHealthNow -= mycard.unitAttack;
    myAction = [NSString stringWithFormat:@"Your %@ attacks %@", mycard.unitName, encard.unitName];

    if(mycard.unitHealthNow <= 0)
    {
        //NSLog(@"myDeath%@",mycard.unitName);
        die1 = [NSString stringWithFormat:@"->Your %@ dies", mycard.unitName];

        mycard.unitHealthNow = 0;
        self.myDeathCnt ++;
    }

    if(encard.unitHealthNow <= 0)
    {
//NSLog(@"enDeath%@",encard.unitName);
        die2 = [NSString stringWithFormat:@"->%@ dies", encard.unitName];
        encard.unitHealthNow = 0;
        self.enDeathCnt ++;
    }
        //NSLog(@"%d : %d", self.myDeathCnt, self.enDeathCnt);
    if ( self.myDeathCnt == 7 && self.enDeathCnt == 7)
    {
        return 1;//전멸
    }
    else if ( self.myDeathCnt == 7)
    {
        return 2;//졌다
    }
    else if ( self.enDeathCnt == 7)
    {
        return 3;//이겼다
    }
    //상대방의 공격 차례
    
    int avilOrAttack = arc4random() % 10;
    
    if (self.enAvilCnt > 0 && avilOrAttack%3 == 0)
    {
        int targetEnemy = arc4random() % 7;
        CardModel *encard3;
        while(1)
        {
            targetEnemy = arc4random()%7;
            encard3 = [self.enModel.playerDeck.cards objectAtIndex:targetEnemy];
            if(encard3.unitHealthNow != 0 || self.enModel.playerNum == 1)
            {
                switch(self.enModel.playerNum)
                {
                    case 1:
                    case 5:
                        if(encard3.unitHealthNow <= 0)
                        {
                            self.enDeathCnt -= 1;
                        }
                        encard3.unitHealthNow = encard3.unitHealth;
                        break;
                    case 2:
                        encard3.unitAttack +=2;
                        break;
                    case 3:
                    case 6:
                        encard3.unitHealthNow +=2;
                        break;
                    case 4:
                        encard3.unitHealthNow +=1;
                        encard3.unitAttack += 1;
                        break;
                    default:break;
                }
                self.enAvilCnt--;
                break;
            }
        }
        
        enAction = [NSString stringWithFormat:@"->Enemy Uses Ability"];
        self.recentAction = [NSString stringWithFormat:@"%@ %@ %@ %@", myAction, die1, die2, enAction];
        return 0;
    }
    
    int attackFromEnemy = arc4random() % 7;
    int targetIsMe = arc4random() % 7;
    CardModel *mycard2;
    CardModel *encard2;
    while(1)
    {
        attackFromEnemy = arc4random()%7;
        targetIsMe = arc4random()%7;
        mycard2 = [self.myModel.playerDeck.cards objectAtIndex:attackFromEnemy];
        encard2 = [self.enModel.playerDeck.cards objectAtIndex:targetIsMe];
        if(mycard2.unitHealthNow != 0 && encard2.unitHealthNow != 0)
        {
            break;
        }
    }
    enAction = [NSString stringWithFormat:@"->%@ attacks Your %@", encard2.unitName, mycard2.unitName];
    mycard2.unitHealthNow -= encard2.unitAttack;
    encard2.unitHealthNow -= mycard2.unitAttack;
    if(mycard2.unitHealthNow <= 0)
    {
        mycard2.unitHealthNow = 0;
        die3 = [NSString stringWithFormat:@"->Your %@ died", mycard2.unitName];
                //NSLog(@"myDeath%@",mycard2.unitName);
        self.myDeathCnt ++;
    }
    
    if(encard2.unitHealthNow <= 0)
    {
        encard2.unitHealthNow = 0;
        die4 = [NSString stringWithFormat:@"->Enemy %@ died", encard2.unitName];
                //NSLog(@"enDeath%@",encard2.unitName);
        self.enDeathCnt ++;
    }
    self.recentAction = [NSString stringWithFormat:@"%@ %@ %@ %@ %@ %@", myAction, die1,die2, enAction, die3, die4];
    if ( self.myDeathCnt == 7 && self.enDeathCnt == 7)
    {
        return 1;
    }
    else if ( self.myDeathCnt == 7)
    {
        return 2;
    }
    else if ( self.enDeathCnt == 7)
    {
        return 3;
    }
    
    return 0;
}

-(NSInteger)avilityProcess
{
    NSString *myAction=@"", *die1=@"", *die2=@"", *enAction=@"";
    CardModel *mycard = [self.myModel.playerDeck.cards objectAtIndex:self.mySelect];
    switch(self.myModel.playerNum)
    {
            
        case 1:
        case 5:
            if(mycard.unitHealthNow <= 0)
            {
                self.myDeathCnt -= 1;
            }
            mycard.unitHealthNow = mycard.unitHealth;
            break;
        case 2:
            mycard.unitAttack +=2;
            break;
        case 3:
        case 6:
            mycard.unitHealthNow +=2;
            break;
        case 4:
            mycard.unitHealthNow +=1;
            mycard.unitAttack += 1;
            break;
        default:break;
    }
    self.myAvilCnt -= 1;

    myAction = @"Your used your ability";

    
        //상대방의 공격 차례
    
    int avilOrAttack = arc4random() % 10;
    
    if (self.enAvilCnt > 0 && avilOrAttack%3 == 0)
    {
        int targetEnemy = arc4random() % 7;
        CardModel *encard3;
        while(1)
        {

            targetEnemy = arc4random()%7;
            encard3 = [self.enModel.playerDeck.cards objectAtIndex:targetEnemy];
            if(encard3.unitHealthNow != 0 || self.enModel.playerNum == 1)
            {
                switch(self.enModel.playerNum)
                {
                    case 1:
                    case 5:
                        if(encard3.unitHealthNow <= 0)
                        {
                            self.enDeathCnt -= 1;
                        }
                        
                        encard3.unitHealthNow = encard3.unitHealth;
                        break;
                    case 2:
                        encard3.unitAttack +=2;
                        break;
                    case 3:
                    case 6:
                        encard3.unitHealthNow +=2;
                        break;
                    case 4:
                        encard3.unitHealthNow +=1;
                        encard3.unitAttack += 1;
                        break;
                    default:break;
                }
                self.enAvilCnt--;
                break;
            }
        }
        enAction = @"->Your used your ability";
        self.recentAction = [NSString stringWithFormat:@"%@ %@", myAction, enAction];
                return 0;
    }
    int attackFromEnemy = arc4random() % 7;
    int targetIsMe = arc4random() % 7;
    CardModel *mycard2;
    CardModel *encard2;
    while(1)
    {
        attackFromEnemy = arc4random()%7;
        targetIsMe = arc4random()%7;
        mycard2 = [self.myModel.playerDeck.cards objectAtIndex:attackFromEnemy];
        encard2 = [self.enModel.playerDeck.cards objectAtIndex:targetIsMe];
        if(mycard2.unitHealthNow != 0 && encard2.unitHealthNow != 0)
        {
            break;
        }
    }
    
    enAction = [NSString stringWithFormat:@"->%@ attacks Your %@", encard2.unitName, mycard2.unitName];
    mycard2.unitHealthNow -= encard2.unitAttack;
    encard2.unitHealthNow -= mycard2.unitAttack;
        if(mycard2.unitHealthNow <= 0)
    {
        mycard2.unitHealthNow = 0;
        die1 = [NSString stringWithFormat:@"->Your %@ died", mycard2.unitName];
               // NSLog(@"myDeath%@",mycard2.unitName);
        self.myDeathCnt ++;
    }
    
    if(encard2.unitHealthNow <= 0)
    {
        encard2.unitHealthNow = 0;
        die2 = [NSString stringWithFormat:@"->%@ died", encard2.unitName];
               // NSLog(@"enDeath%@",encard2.unitName);
        self.enDeathCnt ++;
    }
    //NSLog(@"%d : %d", self.myDeathCnt, self.enDeathCnt);
    
    self.recentAction = [NSString stringWithFormat:@"%@ %@ %@ %@", myAction, enAction, die1, die2];
    
    if ( self.myDeathCnt == 7 && self.enDeathCnt == 7)
    {
        return 1;
    }
    else if ( self.myDeathCnt == 7)
    {
        return 2;
    }
    else if ( self.enDeathCnt == 7)
    {
        return 3;
    }
    
    return 0;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if([buttonTitle isEqualToString:@"Ok"])//Selected "Give Up"
    {
        //[self performSegueWithIdentifier:@"backToMain" sender:self];
    }
   
}


@end
