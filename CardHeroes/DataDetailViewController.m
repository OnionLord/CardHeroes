//
//  CampaginDetailViewController.m
//  CardHeroes
//
//  Created by KimSH on 5/27/14.
//  Copyright (c) 2014 COMP420. All rights reserved.
//

#import "DataDetailViewController.h"

@interface DataDetailViewController ()
- (void)configureView;
@end

@implementation DataDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(Data*)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        [self configureView];
    }
}

- (void)configureView
{

  if (self.detailItem) {
      self.detailDescriptionLabel.text = self.detailItem.title;
      self.dataContent.text = self.detailItem.content;
      self.dataImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.detailItem.imgName]];

  }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
