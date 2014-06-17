//
//  DataDataController.m
//  CardHeroes
//
//  Created by KimSH on 5/27/14.
//  Copyright (c) 2014 COMP420. All rights reserved.
//

#import "DataDataController.h"
#import "Data.h"

@interface DataDataController ()
@property (nonatomic, readonly) NSMutableArray *DataList;
@property (nonatomic, strong) NSString *content1;
@property (nonatomic, strong) NSString *content2;
@property (nonatomic, strong) NSString *content3;
@property (nonatomic, strong) NSString *content4;
@property (nonatomic, strong) NSString *content5;
@property (nonatomic, strong) NSString *content6;
@property (nonatomic, strong) NSString *content7;

- (void) initializeDefaultData;
@end

@implementation DataDataController

- (id) init
{
    self = [super init];
    [self storeContent];
    if (self)
    {
        _DataList = [[NSMutableArray alloc] init];
        [self initializeDefaultData];
        return self;
    }
    
    return nil;
}

- (void)initializeDefaultData {
    [self addDataWithTitle:@"정도전"  summary:@"조선을 세운 혁명가."  campId:@"Cam01_01" imgName:@"data01" content : self.content1 type:@"인물"];
    [self addDataWithTitle:@"이방원"  summary:@"강력한 야심가."  campId:@"Cam02_01"imgName:@"data02" content : self.content2 type:@"인물"];
    [self addDataWithTitle:@"주원장"  summary:@"중원의 새로운 실력가."  campId:@"Cam02_01" imgName:@"data03" content : self.content3 type:@"인물"];
    [self addDataWithTitle:@"제 1차 왕자의 난"  summary:@"조선의 첫번째 비극."  campId:@"Cam03_01" imgName:@"data04" content : self.content4 type:@"역사"];
    [self addDataWithTitle:@"김보성"  summary:@"의리의 수호자."  campId:@"Cam03_01" imgName:@"data05" content : self.content5 type:@"인물"];
    [self addDataWithTitle:@"간디"  summary:@"비폭력의 이면에 감추어진 정복욕."  campId:@"Cam03_01" imgName:@"data06" content : self.content6 type:@"인물"];
    [self addDataWithTitle:@"관대하"  summary:@"간디와 동맹맺은 페르시아의 지도자."  campId:@"Cam03_01" imgName:@"data07" content : self.content7 type:@"유닛"];

    
}

- (void)addDataWithTitle:(NSString *)title summary:(NSString *)summary campId:(NSString *)campId imgName:(NSString *)imgName content:(NSString *)content type:(NSString *)type
{
    Data *newData = [[Data alloc] initWithTitle:title summary:summary  campId:campId imgName:imgName content:content type:type];
    [self.DataList addObject:newData];
}

- (NSUInteger)DataCount
{
    return [self.DataList count];
}

- (Data *)DataAtIndex:(NSUInteger)index
{
    return [self.DataList objectAtIndex:index];
}

//원래는 파일,DB,웹파싱등으로 가져와야 하는걸 이렇게 처리합니다 --
-(void)storeContent
{
    self.content1 = @"챌린지정";
    self.content2 = @"조선 태종 킬방원.";
    self.content3 = @"주원장 그냥 주원장.";
    self.content4 = @"킬방원 승.";
    
    self.content5=@"의리 의리 의리.";
    
    
    self.content6=@"옥수수 줄게 다이아몬드 다오.";
    self.content7=@"나는 관대하다.";
}

@end
