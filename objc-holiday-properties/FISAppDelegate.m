//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
   // to return an array of all of the "holiday" keys in the sub-dictionary associated with the submitted "season" argument.
    NSMutableArray *holidays = [[NSMutableArray alloc] init];
    for (NSString *key in self.database){
        if ([key isEqualToString:season]){
            NSArray *holidaysInSeason = [self.database[key] allKeys];
            holidays = [holidaysInSeason mutableCopy];
        }
    }
    NSArray *correctHolidays = [holidays copy];
    return correctHolidays;

}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    
    NSMutableArray *suppliesInSeason = self.database[season][holiday];
    
    return suppliesInSeason;

}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    
    if ([self.database[season] objectForKey:holiday] != nil){
        return YES;
    }
    return NO;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    
    if ([self.database[season] objectForKey:holiday] != nil){
        if ([self.database[season][holiday] containsObject:supply]){
            return YES;
        }
        
    }
    
    return NO;
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
    if ([self.database objectForKey:season] != nil){
        self.database[season][holiday] = [ [NSMutableArray alloc] init];
    }
    
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    if ([self.database objectForKey:season] != nil){
        if ([self.database[season] objectForKey:holiday] != nil){
            [self.database[season][holiday] addObject:supply];
        }
    }
}

@end
