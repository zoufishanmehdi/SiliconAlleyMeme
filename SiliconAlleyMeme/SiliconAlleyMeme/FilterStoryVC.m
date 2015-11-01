//
//  FilterStoryVC.m
//  SiliconAlleyMeme
//
//  Created by Zoufishan Mehdi on 10/31/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "FilterStoryVC.h"
#import "cameraImageDelegate.h"
#import "UIImage+Filter.h"
#import "AddFilterVC.h"

@interface FilterStoryVC ()
@property (weak, nonatomic) IBOutlet UIImageView *pictureTakenImageView;

@property (weak, nonatomic) IBOutlet UITextView *enterStoryTextView;
@property (weak, nonatomic) IBOutlet UIButton *shareStoryButton;

@property (weak, nonatomic) IBOutlet UIButton *siliconFilterButton;
@property (weak, nonatomic) IBOutlet UIButton *takePic;

@property (nonatomic) NSMutableArray *storyPics;

@end


@implementation FilterStoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.enterStoryTextView.delegate = self;
    
    NSMutableArray *storyPics = [[NSMutableArray alloc] init];
    
    self.picker = [[UIImagePickerController alloc] init];
    self.picker.delegate = self;
    self.pictureTakenImageView.clipsToBounds = YES;
    
    self.pictureTakenImageView.image = self.imagePassed;
    
}

- (IBAction)siliconButtonTapped:(UIButton *)sender {
    
    UIImage *cameraImg = self.pictureTakenImageView.image;

    
    float width = 320.0;
    float ratio = width / cameraImg.size.width;
    UIImage *scaledImage = [cameraImg resize:CGSizeMake(width, cameraImg.size.height * ratio)];
    
    UIImage *siliconAlleyFilter = [UIImage imageNamed:@"womenofsiliconalley.png"];
    
    UIImage *finalImage = [UIImage drawImage:siliconAlleyFilter inImage:scaledImage atPoint:CGPointZero];
    
}


- (IBAction)filterTwoTapped:(UIButton *)sender {
}
- (IBAction)filterThreeTapped:(UIButton *)sender {
}
- (IBAction)filterFourTapped:(UIButton *)sender {
}
- (IBAction)filterFiveTapped:(UIButton *)sender {
}


- (IBAction)takePicButtonTapped:(UIButton *)sender {
    
    self.picker.allowsEditing = YES;
    self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:self.picker animated:YES completion:NULL];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    //    DisplayPicTableViewCell *cell = [self.picTableView dequeueReusableCellWithIdentifier:@"DisplayPicID"];
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.pictureTakenImageView.image = chosenImage;
    //cell.displayPicImageView.image = chosenImage;
    
    //store image into NSMutableArray
    [self.storyPics addObject:chosenImage];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}




- (void)textFieldDidBeginEditing:(UITextView *)textView {
    textView.text = @" ";
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.enterStoryTextView resignFirstResponder];
}



- (IBAction)shareStoryButtonTapped:(UIButton *)sender {
    
    [self.delegate memeGenerator:self.pictureTakenImageView.image theLabel:self.enterStoryTextView.text];
//    [self dismissViewControllerAnimated:YES completion:nil];
//    NSLog(@"working");
    
    
    UINavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"addFilterNav"];
    
    AddFilterVC *addFilter = (AddFilterVC *) navigationController.topViewController;
    
   // hInfo.habitsArray = self.habitsArray;
    
    [self presentViewController:navigationController animated:YES completion:nil];
    
    
//    AddFilterVC *addFilter = (AddFilterVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"AddFilterID"];
//    
//    
//    [self.navigationController pushViewController:addFilter animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
