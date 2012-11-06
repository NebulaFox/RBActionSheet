//
//  RBActionSheet.h
//  CarCamApp
//
//  Created by Robbie Bykowski on 06/11/2012.
//  Copyright (c) 2012 Helium End. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RBActionSheet;

/// the block type that will be passed an action sheet and a button index
typedef void (^RBActionSheetWithButtonIndexBlock)(RBActionSheet *, NSInteger buttonIndex);

/// the block type that will be passed an action sheet
typedef void (^RBActionSheetBlock)(RBActionSheet *);

/// Extends `UIActionSheet` to handle delegation via blocks
/**
 *  @see UIActionSheet
 *  @see UIActionSheetDelegate
 */
@interface RBActionSheet : UIActionSheet <UIActionSheetDelegate>

@property ( strong, nonatomic ) RBActionSheetWithButtonIndexBlock clickedBlock; ///< the block called on `actionSheet:clickedButtonIndex:`
@property ( strong, nonatomic ) RBActionSheetWithButtonIndexBlock didDismissBlock; ///< the block called on `actionSheet:didDismissWithButtonIndex:`
@property ( strong, nonatomic ) RBActionSheetWithButtonIndexBlock willDimissBlock; ///< the block called on `actionSheet:wilDismissWithButtonIndex:`
@property ( strong, nonatomic ) RBActionSheetBlock willPresetBlock; ///< the block called on `willPresentActionSheet:`
@property ( strong, nonatomic ) RBActionSheetBlock didPresentBlock; ///< the block called on `didPresentActionSheet:`
@property ( strong, nonatomic ) RBActionSheetBlock cancelBlock; ///< the block called on `actionSheetCanceld:`


- (id)   initWithTitle:(NSString *)title
     cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
     otherButtonTitles:(NSArray *)otherButtonTitles
          clickedBlock:(RBActionSheetWithButtonIndexBlock)clickedBlock;

- (RBActionSheet *)actionSheetWithTitle:(NSString *)title
                     cancelButtonTitile:(NSString *)cancelButtonTitle
                 destructiveButtonTitle:(NSString *)destructiveButtonTitle
                     otherButtonTitiles:(NSArray *)otherButtonTitiles
                           clickedBlock:(RBActionSheetWithButtonIndexBlock)clickedBlock;

@end
