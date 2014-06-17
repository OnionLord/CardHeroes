//
//  ViewController.h
//  CardHeroes
//
//  Created by KimSH on 5/27/14.
//  Copyright (c) 2014 COMP420. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController < UIPickerViewDataSource, UIPickerViewDelegate >
@property (weak, nonatomic) IBOutlet UIPickerView *myPicker;

@property (strong, nonatomic) IBOutlet UIImageView *myImage;
@property (strong, nonatomic) IBOutlet UIImageView *enImage;


@end
