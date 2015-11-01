//
//  CreateHomeVC.m
//  SiliconAlleyMeme
//
//  Created by Zoufishan Mehdi on 10/31/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "CreateHomeVC.h"
#import "FilterStoryVC.h"
#import "DisplayPicTableViewCell.h"

@interface CreateHomeVC ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *homeButton;

@property (weak, nonatomic) IBOutlet UIButton *createButton;
//@property (weak, nonatomic) IBOutlet UITableView *picTableView;
//@property (weak, nonatomic) IBOutlet UIView *pictureView;

@property (weak, nonatomic) IBOutlet UIImageView *homeImage;
@property (weak, nonatomic) IBOutlet UILabel *storyLabel;

@end

@implementation CreateHomeVC

- (void) viewDidLoad {
    //self.picTableView.dataSource = self;
//    UINib *nib = [UINib nibWithNibName:@"DisplayPicTableViewCell" bundle:nil];
//    [self.picTableView registerNib:nib forCellReuseIdentifier:@"DisplayPicID"];
    
    
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panning:)];
    [self.storyLabel addGestureRecognizer:pan];
    
    
    //self.enterStuffHereField.delegate = self;
//    self.picker = [[UIImagePickerController alloc] init];
//    self.picker.delegate = self;
    //self.imageCameraImage.clipsToBounds = YES;
}



-(void) viewWillAppear:(BOOL)animated {
    [self.view setNeedsDisplay];
}


- (void)panning:(UIPanGestureRecognizer *)gesture {
    switch (gesture.state) {
        case UIGestureRecognizerStateChanged: {
            CGPoint location = [gesture locationInView:self.view];
            self.storyLabel.center = location;
            break;
        }
        default:
            return;
    }
}

- (void) memeGenerator: (UIImage *)storyImage theLabel: (NSString *)storyString{
    self.homeImage.image = storyImage;
    self.storyLabel.text = storyString;
    NSLog(@"image: %@, text: %@", storyImage, storyString);
}

-(void) prepareForSegue:(nonnull UIStoryboardSegue *)segue sender:(nullable id)sender {
    FilterStoryVC *vc = segue.destinationViewController;
    vc.delegate = self;
    vc.imagePassed = self.homeImage.image;

}


-(UIImage *)capture{
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *imageView = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(imageView, nil, nil, nil); //if you need to save
    return imageView;
}




- (IBAction)homeButtonTapped:(UIBarButtonItem *)sender {
}
- (IBAction)createButtonTapped:(UIButton *)sender {
    
     FilterStoryVC *filterStory = (FilterStoryVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"FilterStoryID"];
    
    
    [self.navigationController pushViewController:filterStory animated:YES];

//    self.picker.allowsEditing = YES;
//    self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
//    [self presentViewController:self.picker animated:YES completion:NULL];
    
}
//    FilterStoryVC *filterStory = (FilterStoryVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"FilterStoryID"];
//    
//    filterStory.imagePassed = cell.displayPicImageView.image;
//    
//    [self.navigationController pushViewController:habNewsTVC animated:YES];
//    
//






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
