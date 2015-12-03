//
//  BusTimes.h
//  myBusTimeApp
//
//  Created by Ewa Czekalska on 02/12/2015.
//  Copyright © 2015 Ewa Czekalska. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BusTimes : NSObject
@property (nonatomic, strong) NSMutableData *responseData;

-(void)startGetBusTimes;
-(NSArray*)getBusTimes;
@end
