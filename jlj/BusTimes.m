//
//  BusTimes.m
//  myBusTimeApp
//
//  Created by Ewa Czekalska on 02/12/2015.
//  Copyright © 2015 Ewa Czekalska. All rights reserved.
//

#import "BusTimes.h"

@implementation BusTimes

-(void)fetchFeed{
    
    //The NSURLSession is created with configuration, a delegate and a delagate queue. The defaults for these arguments are what you want for this appliction. You get a default configuration and pass that in for the first argument. For the second and fird arguments you simply pass in nill to get the defaults
    NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
    //i think its better if i move this code _session when i create bus object?
    _session=[NSURLSession sessionWithConfiguration:config
                                           delegate:nil
                                      delegateQueue:nil];
    NSString *requestString=@"https://api.tfl.gov.uk/Line/323/Arrivals?app_id=818ded17&app_key=6d5e22813ba9aa70bb6d2f30a32b82ef";
    NSURL *url=[NSURL URLWithString:requestString];
    NSURLRequest *req  = [NSURLRequest requestWithURL:url];
 
    NSURLSessionDataTask *dataTask =[self.session  dataTaskWithRequest:req completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error)
    {
     NSArray *jsonObject=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
     self.busesTimes=jsonObject;
     NSLog(@"hello %@", jsonObject);
     
    }];
    
    [dataTask resume];
}



-(NSArray*)getBusTimes{
    // convert to JSON
    
    NSArray *busTimes;
    busTimes=_busesTimes;

    
    return busTimes;
}

@end

