//
//  CoordinationViewController.h
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-28.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanvesViewController.h"
#import "ThumbnailViewController.h"


typedef enum {
    kButtonTagDene,
    kButtonTagOpenPlatterView,
    kButtonTagOpenThumbnailView,
    kButtonTagSave,
    kButtonTagDELETE,
    kUNDO,
    kREDO
}ButtonTag;

@interface CoordinationViewController : UIViewController

@property (nonatomic,strong)UIViewController *activeViewcontroller;
@property (nonatomic,strong)CanvesViewController *canvasViewController;


+(CoordinationViewController *)sharedInstance;


@end
