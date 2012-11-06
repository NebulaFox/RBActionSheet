# RBActionSheet

`RBActionSheet` is an extension of `UIActionSheet` that uses blocks instead of a delegate.
The code compiles under Apple LLVM compiler 4.0 and above. It also requires the base SDK of iOS 5.0.

## Example

```objc
[[RBActionSheet actionSheetWithTitle:@"An Awesome Titile"
                  cancelButtonTitile:@"Cancel"
              destructiveButtonTitle:@"Destroy"
                   otherButtonTitles:@[ @"Eleborate", @"Expand", @"Expelliarmus" ] // an array literal
                        clickedBlock:^( RBAlertView *alert, NSInterger buttonIndex )
									 {
										 switch ( buttonIndex )
										 {
											 case 0: // Awesome // cancel button
												 NSLog( @"Awesome" ); break;
											 case 1:
												 NSLog( @"Eleborate" ); break;
											 case 2:
												 NSLog( @"Expand" ); break;
											 case 3:
												 NSLog( @"Expelliarmus" ); break;
										 }
									 }
] showInView:self.view]; // just assuming this code is inside a view controller
```