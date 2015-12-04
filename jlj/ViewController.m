//
//  ViewController.m
//  jlj
//
//  Created by Ewa Czekalska on 08/11/2015.
//  Copyright © 2015 Ewa Czekalska. All rights reserved.
//

#import "ViewController.h"
#import "BusTimes.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *dayLabel;
@property (strong, nonatomic) BusTimes *bus;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewdidload");
    
    
    [self setBackgroundColour];
    self.bus=[[BusTimes alloc]init  ];
    [self.bus startGetBusTimes];
}


- (IBAction)showMeBus:(id)sender {
    
    for (NSDictionary *avatar in [self.bus getBusTimes]) {
        NSString *name = avatar[@"expectedArrival"];
        NSLog(@"@The next bus is in %@", name);
        self.displayLabel.text=name;
    }
}

    -(void)setBackgroundColour{
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"EEEE"];
        NSString *lookup=[dateFormatter stringFromDate:[NSDate date]];
        
        typedef void (^CaseBlock)();
        
        NSDictionary *d=@{
                          @"Monday":
                             ^{
                                  self.view.backgroundColor=[UIColor brownColor];
                              },
                          @"Tuesday":
    
                              ^{
                                  self.view.backgroundColor=[UIColor yellowColor];
                              },
                          @"Wednesday":
                              
                              ^{
                                  self.view.backgroundColor=[UIColor blueColor];
                              },
                          @"Thursday":
                              
                              ^{
                                  self.view.backgroundColor=[UIColor purpleColor];
                              },
                          @"Friday":
                              
                              ^{
                                  self.view.backgroundColor=[UIColor greenColor];
                              },
                          
                          };
        
        CaseBlock c = d[lookup];
        if (c) c(); else { self.view.backgroundColor=[UIColor grayColor]; }
        

        self.dayLabel.text=[NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:[NSDate date]]];
                
        }



      @end
