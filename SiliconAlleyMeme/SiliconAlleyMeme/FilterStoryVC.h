//
//  FilterStoryVC.h
//  SiliconAlleyMeme
//
//  Created by Zoufishan Mehdi on 10/31/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cameraImageDelegate.h"
#import "CollectionDelegate.h"

@interface FilterStoryVC : UIViewController <UITextViewDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic) UIImagePickerController *picker;

@property (weak,nonatomic) id <cameraImageDelegate> delegate;

@property (nonatomic, weak) id <CollectionDelegate> delegateTwo;

@property (nonatomic) UIImage *imagePassed; 

-(void)addFilter; 

@end
