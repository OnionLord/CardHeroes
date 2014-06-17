//
//  GameViewController.m
//  CardHeroes
//
//  Created by KimSH on 5/29/14.
//  Copyright (c) 2014 COMP420. All rights reserved.
//

#import "GameViewController.h"
#import "ViewController.h"
#import "GameModel.h"
@interface GameViewController ()

@property (strong, nonatomic) IBOutlet UILabel *battleNameTag;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *myCard;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *enCard;

@property (strong, nonatomic) GameModel *game;

@property (strong, nonatomic) IBOutlet UIButton *enemyCommander;
@property (strong, nonatomic) IBOutlet UIButton *myCommander;
@property (strong, nonatomic) IBOutlet UILabel *myAvlityName;
@property (strong, nonatomic) IBOutlet UILabel *enAvilityName;

@property (strong, nonatomic) IBOutlet UILabel *historyLabel;

@end

@implementation GameViewController

- (BOOL) shouldAutorotate {
    return NO;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([self.presentedViewController isKindOfClass:[UINavigationController class]]) {
        UIViewController *rootController = [((UINavigationController *)self.presentedViewController).viewControllers objectAtIndex:0];
        return [rootController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
    }
    return [self.presentedViewController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//게임 포기시 메시지
- (IBAction)sureToExit:(UIButton *)sender
{
    UIAlertView *sureToExit = [[UIAlertView alloc]initWithTitle:@"Give Up" message:@"Are you sure to give up?" delegate:self cancelButtonTitle:@"Remain" otherButtonTitles:@"Give Up", nil];
    [sureToExit show];
}
//UIAlert에서 Give Up를 선택시 첫 화면으로 돌아감
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if([buttonTitle isEqualToString:@"Give Up"])//Selected "Give Up"
    {
        [self performSegueWithIdentifier:@"backToMain" sender:self];
    }
    else if([buttonTitle isEqualToString:@"Ok"])
    {
        [self performSegueWithIdentifier:@"backToMain" sender:self];
    }
    else if([buttonTitle isEqualToString:@"Attack!"] ||[buttonTitle isEqualToString:@"Sure"] )
    {
        NSInteger result;
        
        if([buttonTitle isEqualToString:@"Attack!"])
        {
            result = [self.game attackProcess];
        }
        else
        {
            result = [self.game avilityProcess];
        }
        
        UIAlertView *resultAlert;
        [self refreshUI];
        switch(result)
        {
            case 0:
                //[self refreshUI];
                break;
            case 1:
                self.game.allEnd = YES;
                resultAlert = [[UIAlertView alloc]initWithTitle:@"Draw" message:@"Draw by Annihilation." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [resultAlert show];
                while ((!resultAlert.hidden) && (resultAlert.superview != nil)) {
                    [[NSRunLoop currentRunLoop] limitDateForMode:NSDefaultRunLoopMode];
                }
                break;
            case 2:
                self.game.allEnd = YES;
                resultAlert = [[UIAlertView alloc]initWithTitle:@"You Lost" message:@"Your history is end." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [resultAlert show];
                while ((!resultAlert.hidden) && (resultAlert.superview != nil)) {
                    [[NSRunLoop currentRunLoop] limitDateForMode:NSDefaultRunLoopMode];
                }
                break;
            case 3:
                self.game.allEnd = YES;
                resultAlert = [[UIAlertView alloc]initWithTitle:@"You Win" message:@"Historians will remember you." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [resultAlert show];
                while ((!resultAlert.hidden) && (resultAlert.superview != nil)) {
                    [[NSRunLoop currentRunLoop] limitDateForMode:NSDefaultRunLoopMode];
                }
                break;
            default:
                
                [self performSegueWithIdentifier:@"backToMain" sender:self];
        }
    }
}
//공격할 본인 카드와 공격대상인 적의 카드를 모두 고르면
//공격 명령을 내려서 공격한다.
//이후 적은 반격한다.
- (IBAction)deceideAttack:(UIButton *)sender
{
    

    if(self.game.mySelect != -1 && self.game.enSelect != -1 && self.game.enSelect != 9000)
    {
        CardModel *mycard = [self.game.myModel.playerDeck.cards objectAtIndex:self.game.mySelect];
        CardModel *encard = [self.game.enModel.playerDeck.cards objectAtIndex:self.game.enSelect];
        UIAlertView *sureToExit = [[UIAlertView alloc]initWithTitle:@"Attack" message:[NSString stringWithFormat:@"%@ will attack to %@.\nIs it Right?",mycard.unitName, encard.unitName] delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Attack!", nil];
        [sureToExit show];
        //[self refreshUI];
    }
    
    if(self.game.mySelect != -1 && self.game.enSelect == 9000 && self.game.myAvilCnt > 0)
    {
        CardModel *mycard = [self.game.myModel.playerDeck.cards objectAtIndex:self.game.mySelect];
        UIAlertView *sureToExit = [[UIAlertView alloc]initWithTitle:@"Ability" message:[NSString stringWithFormat:@"Do you wanna use your ability to %@?",mycard.unitName] delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Sure", nil];
        [sureToExit show];
        //[sureToExit release];
        //[self refreshUI];
    }
    
}
- (IBAction)myCommanderSelect:(UIButton *)sender
{
    NSLog(@"%d", self.game.myAvilCnt);
    if(self.game.myAvilCnt > 0 )
    {
        if(self.game.enSelect != -1 && self.game.enSelect != 9000)
        {
            UIButton *tmp = [self.enCard objectAtIndex:self.game.enSelect];
            
            [tmp setBackgroundImage:self.game.beforeEnPortrait forState:UIControlStateNormal];
            [tmp setTitle:@"" forState:UIControlStateNormal];
            //[self.myCommander setAlpha:1.0];
        }
        self.game.enSelect = 9000;
        [self.myCommander setAlpha:0.5];
    }
    else{
        //self.game.enSelect = -1;
    }
}


//플레이어의 카드를 눌렀을때
- (IBAction)myTouchCardButton:(UIButton *)sender
{

    int chosenButtonIndex = [self.myCard indexOfObject:    sender];
    CardModel *card = [self.game.myModel.playerDeck.cards objectAtIndex:chosenButtonIndex];
    //체력이 0이되면 더이상 응답하지 않는다. 단 부활 능력 가진 커맨더선택후에는 선택 가능.
    if(card.unitHealthNow > 0 || (self.game.enSelect == 9000 && (self.game.myModel.playerNum == 1||self.game.myModel.playerNum == 5) && self.game.myAvilCnt > 0))
    {
        if((self.game.mySelect != -1) && self.game.mySelect != 9000)
        {
            UIButton *tmp = [self.myCard objectAtIndex:self.game.mySelect];
            //이전 부분 복원
            [tmp setBackgroundImage:self.game.beforeMyPortrait forState:UIControlStateNormal];
            [tmp setTitle:@"" forState:UIControlStateNormal];
            [self.enemyCommander setAlpha:1.0];
        }
        //현재 선택한 카드의 상태 보여주기
        self.game.beforeMyPortrait = sender.currentBackgroundImage;
        self.game.mySelect = chosenButtonIndex;
        
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        
        
        NSString *unitInfo = [NSString stringWithFormat:@"%@\n❤️%d\n⚡️%d",card.unitName, card.unitHealthNow, card.unitAttack];
        sender.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        sender.titleLabel.numberOfLines = 3;
        [sender setTitle:unitInfo forState:UIControlStateNormal];
        
    }
    else if(self.game.enSelect == 9000 && self.myNum == 1)
    {
        
    }
    
        //[self updateUI];
}
//적의 카드를 눌렀을때
- (IBAction)enTouchCardButton:(UIButton *)sender
{
    
    int chosenButtonIndex = [self.enCard indexOfObject:    sender];
    CardModel *card = [self.game.enModel.playerDeck.cards objectAtIndex:chosenButtonIndex];
    



    if(card.unitHealthNow > 0)
    {
        [self.myCommander setAlpha:1.0];
        if(self.game.enSelect != -1 && self.game.enSelect != 9000)
        {
            UIButton *tmp = [self.enCard objectAtIndex:self.game.enSelect];
            
            [tmp setBackgroundImage:self.game.beforeEnPortrait forState:UIControlStateNormal];
            [tmp setTitle:@"" forState:UIControlStateNormal];
        }
        self.game.beforeEnPortrait = sender.currentBackgroundImage;
        self.game.enSelect = chosenButtonIndex;
        
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        
        
        NSString *unitInfo = [NSString stringWithFormat:@"%@\n❤️%d\n⚡️%d",card.unitName, card.unitHealthNow, card.unitAttack];
        sender.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        sender.titleLabel.numberOfLines = 3;
        [sender setTitle:unitInfo forState:UIControlStateNormal];
        
    }
    if(self.game.mySelect != -1)
    {
        CardModel *myDeathCard = [self.game.myModel.playerDeck.cards objectAtIndex:self.game.mySelect];
        if(myDeathCard.unitHealthNow == 0)
        {
            self.game.mySelect = -1;
            UIButton *tmp = [self.myCard objectAtIndex:self.game.mySelect];
            [tmp setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
            [tmp setTitle:@"" forState:UIControlStateNormal];
        }
    }
    
    //[self updateUI];
}

-(void)refreshUI
{
    int i;
    self.game.mySelect = -1;
    self.game.enSelect = -1;
    [self.myCommander setAlpha:1.0];
    
    NSArray *avilName = @[@"♻︎", @"⚡️+2",@"❤️+2",@"❤️+1 ⚡️+1",@"♻︎",@"❤️+2"];
    
    NSString *myAvail = [NSString stringWithFormat:@"%@\n%d Times", avilName[self.game.myModel.playerNum-1],self.game.myAvilCnt];
    
    NSString *enAvail = [NSString stringWithFormat:@"%@\n%d Times", avilName[self.game.enModel.playerNum-1],self.game.enAvilCnt];
    
    self.myAvlityName.text = myAvail;
    self.enAvilityName.text = enAvail;
    self.historyLabel.text = self.game.recentAction;
    for( i = 1 ; i <= 7 ; i ++)
    {
        
        CardModel *mycard = [self.game.myModel.playerDeck.cards objectAtIndex:i-1];
        CardModel *encard = [self.game.enModel.playerDeck.cards objectAtIndex:i-1];
        UIButton *button = [self.myCard objectAtIndex:i-1];
        UIButton *button1 = [self.enCard objectAtIndex:i-1];
        
        //죽은 카드는 더이상 나타나지 않는다.
        if(mycard.unitHealthNow > 0)
        {
            [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d%d0",self.myNum,i]] forState:UIControlStateNormal];
        }
        else
        {
            [button setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];

        }
        
        if(encard.unitHealthNow > 0)
        {
            [button1 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d%d0",self.enNum,i]] forState:UIControlStateNormal];
        }
        else
        {
            [button1 setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
            
        }
        
        [button setTitle:@"" forState:UIControlStateNormal];
        [button1 setTitle:@"" forState:UIControlStateNormal];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self.game gameInit:self.myNum enemy:self.enNum];
    //NSLog(@"%@", self.game.gameName);
    
    
    self.game = [[GameModel alloc] gameInit:self.myNum enemy:self.enNum];
    self.battleNameTag.text = self.game.gameName;

    [self.myCommander setBackgroundImage:[UIImage imageNamed:self.game.myModel.playerPortrait] forState:UIControlStateNormal];
    [self.enemyCommander setBackgroundImage:[UIImage imageNamed:self.game.enModel.playerPortrait] forState:UIControlStateNormal];

    
    
    [self refreshUI];
    
}

@end
