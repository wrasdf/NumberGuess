//
// Created by twer on 2/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@protocol NGSettingHomeProtocol;

@interface NGSettingTableLogic : NSObject <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain) NSArray *items;
@property (nonatomic,retain) id<NGSettingHomeProtocol> delegate;
@end