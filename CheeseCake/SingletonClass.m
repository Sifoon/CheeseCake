//
//  SingletonClass.m
//  Share_Car_iOS
//
//  Created by Wissem Rezgui on 01/12/2014.
//  Copyright (c) 2014 Wissem Rezgui. All rights reserved.
//

#import "SingletonClass.h"

@implementation SingletonClass

@synthesize userOfProgramCreator;
@synthesize details;
@synthesize userInformations;
@synthesize jsonData;


#pragma mark Singleton Methods


+ (id)sharedUserProgramCreator {
    static SingletonClass *sharedUserProgramCreator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUserProgramCreator = [[self alloc] init];
    });
    return sharedUserProgramCreator;
}

+ (id)DetailsByAuthors {
    static SingletonClass *details = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        details = [[self alloc] init];
    });
    return details;
}




+ (id)UserInformation {
    static SingletonClass *userInf = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userInf = [[self alloc] init];
    });
    return userInf;
}

+ (id)JsonData {
    static SingletonClass *jsondata = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        jsondata = [[self alloc] init];
    });
    return jsondata;
}



- (id)init {
    if (self = [super init]) {
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end
