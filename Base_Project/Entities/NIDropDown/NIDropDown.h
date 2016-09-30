//
//  NIDropDown.h
//  NIDropDown
//
//  Created by Bijesh N on 12/28/12.
//  Copyright (c) 2012 Nitor Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NIDropDown;
@protocol NIDropDownDelegate
- (void) niDropDownDelegateMethod: (NIDropDown *) sender;
- (void) niDropSelectedSring : (NSString *) str;
- (void) niDropSelectedSring : (NSString *) str withIndex :(NSString *) strIndex;
@end

@interface NIDropDown : UIView <UITableViewDelegate, UITableViewDataSource>
{
    NSString *animationDirection;
    UIImageView *imgView;
    
}
@property(nonatomic, strong) UITableView *table;
@property (nonatomic) BOOL is_TimeDisplay;
@property (nonatomic, retain) id <NIDropDownDelegate> delegate;
@property (nonatomic, retain) NSString *animationDirection;
-(void)hideDropDown:(UIButton *)b;
- (id)showDropDown:(UIButton *)b :(NSArray *)arr :(NSArray *)imgArr :(NSString *)direction;
- (id)showDropDownWithHeight:(UIButton *)b :(NSArray *)arr :(NSArray *)imgArr :(NSString *)direction :(CGFloat) height;
- (id)showDropDownWithHeightOFButtonTopFrame:(UIButton *)b :(NSArray *)arr :(NSArray *)imgArr :(NSString *)direction :(CGFloat) height;
@end
