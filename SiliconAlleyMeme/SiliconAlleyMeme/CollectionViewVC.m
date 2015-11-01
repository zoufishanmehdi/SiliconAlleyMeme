//
//  CollectionViewVC.m
//  SiliconAlleyMeme
//
//  Created by Zoufishan Mehdi on 11/1/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "CollectionViewVC.h"
#import "FilterStoryVC.h"

@interface CollectionViewVC ()

@property (nonatomic) NSMutableArray *storyCollection;

//NSArray *collectionImages;

@end


@implementation CollectionViewVC


-(void)viewDidLoad {
    
    NSMutableArray *storyCollection = [[NSMutableArray alloc] init]; 
    
//    collectionImages = [NSArray arrayWithObjects:@"image1.png",@"image2.png",@"image3.png",@"image4.png",@"image5.png",@"image6.png",@"image7.png",@"image8.png",@"image9.png",@"image10.png",@"image11.png", nil];
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


- (void)secondViewControllerDidFinish:(FilterStoryVC *)secondViewController {
    NSMutableArray *storyCollection = [[NSMutableArray alloc] init];
    self.storyCollection = secondViewController.;
}


#pragma mark- Collection View

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return collectionImages.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *collectionImageView = (UIImageView *)[cell viewWithTag:100];
    
    collectionImageView.image = [UIImage imageNamed:[collectionImages objectAtIndex:indexPath.row]];
    return cell;
    
}

@end
