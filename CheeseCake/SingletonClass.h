//
//  SingletonClass.h
//  Share_Car_iOS
//
//  Created by Wissem Rezgui on 01/12/2014.
//  Copyright (c) 2014 Wissem Rezgui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingletonClass : NSObject {
    NSDictionary *userOfProgramCreator;
    NSDictionary *details;
    NSDictionary *userInformations;
    NSArray *jsonData;

    
}

@property (nonatomic, retain) NSDictionary *userOfProgramCreator;
@property (nonatomic, retain) NSDictionary *details;
@property (nonatomic, retain) NSDictionary *userInformations;
@property (nonatomic, retain) NSArray *jsonData;



+ (id)sharedUserProgramCreator;
+ (id)DetailsByAuthors;
+ (id)UserInformation;
+ (id)JsonData;

@end
