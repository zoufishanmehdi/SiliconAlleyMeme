//
//  CollectionDelegate.h
//  SiliconAlleyMeme
//
//  Created by Zoufishan Mehdi on 11/1/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FilterStoryVC.h"
#import "CollectionViewVC.h"

@protocol CollectionDelegate <NSObject>

- (void)secondViewControllerDidFinish:(NSMutableArray *)collectionPhotos;

@end
