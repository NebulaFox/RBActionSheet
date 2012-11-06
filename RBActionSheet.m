//
//  RBActionSheet.m
//  CarCamApp
//
//  Created by Robbie Bykowski on 06/11/2012.
//  Copyright (c) 2012 Helium End. All rights reserved.
//

#import "RBActionSheet.h"

@implementation RBActionSheet

- (id)initWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles clickedBlock:(RBActionSheetWithButtonIndexBlock)clickedBlock
{
    self = [super init];
    
    if ( self )
    {
        [self setTitle:title];
        
        for ( NSString * buttonTitle in otherButtonTitles )
        {
            [self addButtonWithTitle:buttonTitle];
        }
        
        uint index = otherButtonTitles.count;
        
        // destructive title
        if ( destructiveButtonTitle != nil )
        {
            [self addButtonWithTitle:destructiveButtonTitle];
            self.destructiveButtonIndex = index;
            index++;
        }
        
        // cancel title
        if ( cancelButtonTitle != nil )
        {
            [self addButtonWithTitle:cancelButtonTitle];
            [self setCancelButtonIndex:index];
        }
        
        self.clickedBlock = clickedBlock;
        self.delegate = self;
    }

    return self;
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    if ( [super respondsToSelector:aSelector] )
    {
        return YES;
    }
    else
    {
        if ( aSelector == @selector(actionSheetCancel:) && self.cancelBlock != nil )
        {
            return YES;
        }
    }
    
    return NO;
}

#pragma - Delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ( self.clickedBlock != nil )
    {
        self.clickedBlock( self, buttonIndex );
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if ( self.willDimissBlock != nil )
    {
        self.willDimissBlock( self, buttonIndex );
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if ( self.didDismissBlock != nil )
    {
        self.didDismissBlock( self, buttonIndex );
    }
}

- (void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
    if ( self.willPresetBlock != nil )
    {
        self.willPresetBlock( self );
    }
}

- (void)didPresentActionSheet:(UIActionSheet *)actionSheet
{
    if ( self.didPresentBlock != nil )
    {
        self.didPresentBlock( self );
    }
}

- (void)actionSheetCancel:(UIActionSheet *)actionSheet
{
    // there is no checking if cancel block is nil
    // because it will be handled by `respondToSelector:`
    // the reason is action sheet will react differently
    // if this method is defined
    self.cancelBlock( self );
}

#pragma - Stactic

+ (RBActionSheet *)actionSheetWithTitle:(NSString *)title
                     cancelButtonTitile:(NSString *)cancelButtonTitle
                 destructiveButtonTitle:(NSString *)destructiveButtonTitle
                      otherButtonTitles:(NSArray *)otherButtonTitles
                           clickedBlock:(RBActionSheetWithButtonIndexBlock)clickedBlock
{
    return [[self alloc] initWithTitle:title
                     cancelButtonTitle:cancelButtonTitle
                destructiveButtonTitle:destructiveButtonTitle
                     otherButtonTitles:otherButtonTitles
                          clickedBlock:clickedBlock];
}

@end
