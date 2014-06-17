//
//  ViewController.m
//  CardHeroes
//
//  Created by KimSH on 5/27/14.
//  Copyright (c) 2014 COMP420. All rights reserved.
//

#import "ViewController.h"
#import "GameViewController.h"
@interface ViewController ()

@property (strong, nonatomic) NSArray *myBossName;
@property (strong, nonatomic) NSArray *enBossName;
@property (nonatomic, assign) NSInteger myNum;
@property (nonatomic, assign) NSInteger enNum;
@property (strong, nonatomic) IBOutlet UIButton *playButton;
@end

@implementation ViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([self.presentedViewController isKindOfClass:[UINavigationController class]]) {
        UIViewController *rootController = [((UINavigationController *)self.presentedViewController).viewControllers objectAtIndex:0];
        return [rootController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
    }
    return [self.presentedViewController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myImage.image = [UIImage imageNamed:@"000"];
    self.enImage.image = [UIImage imageNamed:@"000"];
    self.myNum = self.enNum = 0;
    self.myBossName = @[@"무작위",@"정도전", @"이방원", @"명", @"A-Pink",@"김보성",@"간디"];
    self.enBossName = @[@"무작위",@"정도전", @"이방원", @"명", @"A-Pink",@"김보성",@"간디"];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return [self.myBossName count];
    }
    else {
        return [self.enBossName count];
    }
}

#pragma mark -
#pragma mark UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return self.myBossName[row];
    }
    else {
        return self.enBossName[row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        self.myImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d00",row]];
        self.myNum = row;
        //return self.myBossName[row];
    }
    else {
        self.enImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d00",row]];
        self.enNum = row;
        //return self.enBossName[row];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    GameViewController *destination = [segue destinationViewController];
    if(self.myNum == 0)
    {
        destination.myNum = arc4random()%(self.myBossName.count-1)+1;
    }
    else
    {
        destination.myNum = self.myNum;

    }
    if(self.enNum == 0)
    {
        destination.enNum = arc4random()%(self.enBossName.count-1)+1;
    }
    else
    {
        destination.enNum = self.enNum;

    }
}

-(IBAction)unwindFromGameViewController:(UIStoryboardSegue *)segue
{
    
}

@end
