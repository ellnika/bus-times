//
//  ViewController.m
//  jlj
//
//  Created by Ewa Czekalska on 08/11/2015.
//  Copyright © 2015 Ewa Czekalska. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *dayLabel;
@property (nonatomic, strong) NSMutableData *responseData;
@end

@implementation ViewController
@synthesize responseData = _responseData;


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewdidload");
    
    
    self.responseData = [NSMutableData data];
    
   NSURLRequest *request = [NSURLRequest requestWithURL:
                           [NSURL URLWithString:@"https://api.tfl.gov.uk/Line/323/Arrivals?app_id=818ded17&app_key=6d5e22813ba9aa70bb6d2f30a32b82ef"]];

    NSURLSession *session = [NSURLSession sharedSession];
  
    
    /* I need to update it to the newer one
     NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      // ...
       */                               // }];
    
    
    [NSURLConnection  connectionWithRequest: request delegate:self];
    

        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"EEEE"];
        NSLog(@"%@", [dateFormatter stringFromDate:[NSDate date]]);
        
        
        if ([[dateFormatter stringFromDate:[NSDate date]]  isEqual: @"Monday"])
            
        {
            self.view.backgroundColor=[UIColor blueColor];
            
            
        }
        
        else
            if ([[dateFormatter stringFromDate:[NSDate date]]  isEqual: @"Tuesday"])
                
            {
                self.view.backgroundColor=[UIColor greenColor];
            }
        
            else
                if ([[dateFormatter stringFromDate:[NSDate date]]  isEqual: @"Wednesday"])
                    
                {
                    self.view.backgroundColor=[UIColor yellowColor];
                    
                }
        
                else
                    if ([[dateFormatter stringFromDate:[NSDate date]]  isEqual: @"Thuesday"])
                        
                    {
                        self.view.backgroundColor=[UIColor purpleColor];
                        
                    }
        
                    else
                        if ([[dateFormatter stringFromDate:[NSDate date]]  isEqual: @"Friday"])
                            
                        {
                            self.view.backgroundColor=[UIColor orangeColor];
                        }
        
                        else
                            
        
                            
                            
                self.view.backgroundColor=[UIColor brownColor];
    
    
    self.dayLabel.text=[NSString stringWithFormat:[dateFormatter stringFromDate:[NSDate date]]];
        
    }
   


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"didReceiveResponse");
    [self.responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError");
    NSLog([NSString stringWithFormat:@"Connection failed: %@", [error description]]);
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"connectionDidFinishLoading");
    NSLog(@"Succeeded! Received %lu bytes of data",[self.responseData length]);
 

    // convert to JSON
    
    NSError *myError = nil;
    NSArray *busTimetable = [NSJSONSerialization JSONObjectWithData:self.responseData options:0 error:&myError];

    
    //each dictionary is at each index
    NSDictionary *firstValue = [busTimetable objectAtIndex:0];
    NSLog(@"first index %@",firstValue);
    
    NSDictionary *firstValue1 = [busTimetable objectAtIndex:1];
   
    //iterate in the dictionary and print out value for given key
    
    NSLog(@"second index %@",firstValue1);
    
    NSLog(@"Bus has %lu indexes", (unsigned long)[busTimetable count]);
    

    // test to see how can I get data for a key
    NSMutableArray *getdata=[[NSMutableArray alloc]init];
    getdata=[firstValue objectForKey:@"towards"];
    NSLog(@"%@",getdata );
    //NSArray *keys= [json allKeys];
   // for (NSString *keysV in busTimetable){
     //   NSLog(@"Keys are %@", keysV);
        //if([Your_Dict objectForKey: keysV] isEqual:@"string to Match"){
            //Do your stuff  here
    
    }
    
    
    //for (NSDictionary *avatar in busTimetable) {
        //NSString *name = avatar[@"expectedArrival"];
        //NSLog(@"@The next bus is in %@", name);
   


 - (IBAction)showMeBus:(id)sender {
     NSError *myError = nil;
     NSArray *busTimetable = [NSJSONSerialization JSONObjectWithData:self.responseData options:0 error:&myError];
    
     
     for (NSDictionary *avatar in busTimetable) {
         NSString *name = avatar[@"expectedArrival"];
         NSLog(@"@The next bus is in %@", name);
         
        self.displayLabel.text=name;
    }
 }
@end
