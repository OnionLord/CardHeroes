//
//  DataTableViewCell.h
//  CardHeroes
//
//  Created by KimSH on 5/27/14.
//  Copyright (c) 2014 COMP420. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *DataTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *DataSummaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *DataType;
@end
