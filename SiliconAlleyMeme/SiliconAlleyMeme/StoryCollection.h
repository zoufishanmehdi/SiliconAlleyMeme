//
//  StoryCollection.h
//  SiliconAlleyMeme
//
//  Created by Zoufishan Mehdi on 11/1/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "PFObject.h"
#import <Parse/Parse.h>

@interface StoryCollection : PFObject <PFSubclassing>

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *storyText;
@property (nonatomic) PFFile *photo;

@end
