//
//  DataDetailViewController.h
//  CardHeroes
//
//  Created by KimSH on 5/27/14.
//  Copyright (c) 2014 COMP420. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "Data.h"
@interface DataDetailViewController : UIViewController<UISplitViewControllerDelegate, UITextViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate,
UIPopoverControllerDelegate, UIActionSheetDelegate,NSLayoutManagerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *dataImageView;
@property (strong, nonatomic) Data* detailItem;
@property (strong, nonatomic) IBOutlet UITextView *dataContent;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
