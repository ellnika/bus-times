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
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, copy) NSArray *busesTimes;
-(void)fetchFeed;
-(NSArray*)getBusTimes;
@end
