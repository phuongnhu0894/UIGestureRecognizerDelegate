//
//  ViewController.m
//  UIGestureRecognizer
//
//  Created by student on 11/23/15.
//  Copyright © 2015 Techmaster. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ballImageView.multipleTouchEnabled = YES;
    self.ballImageView.userInteractionEnabled = YES;
    

    UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotationWithGestureRecognizer:)];
    rotationGestureRecognizer.delegate = self;
    [self.ballImageView addGestureRecognizer:rotationGestureRecognizer];
    

    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchWithGestureRecognizer:)];
    pinchGestureRecognizer.delegate = self;
    [self.ballImageView addGestureRecognizer:pinchGestureRecognizer];
    //[pinchGestureRecognizer requireGestureRecognizerToFail:rotationGestureRecognizer];   //Rotation duoc uu tien
    //[rotationGestureRecognizer requireGestureRecognizerToFail:pinchGestureRecognizer];   //Pinch duoc uu tien
}

- (void) handlePinchWithGestureRecognizer:(UIPinchGestureRecognizer *)pinchGestureRecognizer {
    self.ballImageView.transform = CGAffineTransformScale(self.ballImageView.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
    pinchGestureRecognizer.scale = 1;
    NSLog(@"Pinch");
}

- (void) handleRotationWithGestureRecognizer:(UIRotationGestureRecognizer *)rotationGestureRecognizer {
    self.ballImageView.transform = CGAffineTransformRotate(self.ballImageView.transform, rotationGestureRecognizer.rotation);
    rotationGestureRecognizer.rotation = 0.0;
    NSLog(@"Rotate");
}
//- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    return YES;         //Pinch duoc nhan dang truoc
//}
//- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    return NO;         //Pinch duoc nhan dang truoc
//}

//- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    if ([gestureRecognizer isMemberOfClass:[UIRotationGestureRecognizer class]] && [otherGestureRecognizer isMemberOfClass:[UIPinchGestureRecognizer class]]) {
//        return YES;
//    } else {
//        return NO;
//    }                   //Rotation duoc uu tien
//}

//- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    if ([gestureRecognizer isMemberOfClass:[UIRotationGestureRecognizer class]] && [otherGestureRecognizer isMemberOfClass:[UIPinchGestureRecognizer class]]) {
//        return YES;
//    } else {
//        return NO;
//    }                   //Pinch duoc uu tien
//}
//- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    if ([gestureRecognizer isMemberOfClass: [UIRotationGestureRecognizer class]] && [otherGestureRecognizer isMemberOfClass:[UIPinchGestureRecognizer class]]) {
//        return YES;
//    } else {
//        return NO;
//    } // Rotation duoc nhan dang truoc
//}

//- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    if ([gestureRecognizer isMemberOfClass: [UIRotationGestureRecognizer class]] && [otherGestureRecognizer isMemberOfClass:[UIPinchGestureRecognizer class]]) {
//        return NO;
//    } else {
//        return YES;
//    } // Pinch duoc nhan dang truoc
//}
@end
