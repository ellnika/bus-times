//
//  BusTimes.m
//  myBusTimeApp
//
//  Created by Ewa Czekalska on 02/12/2015.
//  Copyright © 2015 Ewa Czekalska. All rights reserved.
//

#import "BusTimes.h"

@implementation BusTimes

-(void)startGetBusTimes{
    
    self.responseData = [NSMutableData data];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:
                             [NSURL URLWithString:@"https://api.tfl.gov.uk/Line/323/Arrivals?app_id=818ded17&app_key=6d5e22813ba9aa70bb6d2f30a32b82ef"]];
    
    
    [NSURLConnection  connectionWithRequest: request delegate:self];
    

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
    NSLog(@"Connection failed:%@",[error description]);
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"connectionDidFinishLoading");
    NSLog(@"Succeeded! Received %lu bytes of data",[self.responseData length]);
    
}

-(NSArray*)getBusTimes{
    // convert to JSON
    

   return [NSJSONSerialization JSONObjectWithData:self.responseData options:0 error:0];
}

@end

