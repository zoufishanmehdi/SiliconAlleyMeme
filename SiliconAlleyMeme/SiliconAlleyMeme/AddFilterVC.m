//
//  AddFilterVC.m
//  SiliconAlleyMeme
//
//  Created by Zoufishan Mehdi on 11/1/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "AddFilterVC.h"

@interface AddFilterVC ()

@property (weak, nonatomic) IBOutlet UIImageView *filteredImage;
@property (weak, nonatomic) IBOutlet UILabel *userStory;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;



@end

@implementation AddFilterVC

-(void)viewDidLoad {
    [super viewDidLoad];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panning:)];
    [self.userStory addGestureRecognizer:pan];
}





-(UIImage *)capture{
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *imageView = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(imageView, nil, nil, nil); //if you need to save
    return imageView;
}
- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
}


@end
