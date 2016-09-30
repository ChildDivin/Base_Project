//
//  NIDropDown.m
//  NIDropDown
//
//  Created by Bijesh N on 12/28/12.
//  Copyright (c) 2012 Nitor Infotech. All rights reserved.
//

#import "NIDropDown.h"
#import "QuartzCore/QuartzCore.h"


@interface NIDropDown ()

@property(nonatomic, strong) UIButton *btnSender;
@property(nonatomic, retain) NSArray *list;
@property(nonatomic, retain) NSArray *imageList;

@end

@implementation NIDropDown
@synthesize table;
@synthesize btnSender;
@synthesize list;
@synthesize imageList;
@synthesize delegate;
@synthesize animationDirection;
@synthesize is_TimeDisplay;
CGRect TempFrame;

- (id)showDropDown:(UIButton *)b :(NSArray *)arr :(NSArray *)imgArr :(NSString *)direction {
    btnSender = b;
    CGFloat height = 100.0;
    animationDirection = direction;
    self.table = (UITableView *)[super init];
    if (self) {
        // Initialization code
        CGRect btn = b.frame;
        TempFrame = b.frame;
        self.list = [NSArray arrayWithArray:arr];
        self.imageList = [NSArray arrayWithArray:imgArr];
        if ([direction isEqualToString:@"up"]) {
            self.frame = CGRectMake(btn.origin.x, btn.origin.y, btn.size.width, 0);
            self.layer.shadowOffset = CGSizeMake(-5, -5);
        }else if ([direction isEqualToString:@"down"]) {
            self.frame = CGRectMake(btn.origin.x, btn.origin.y+btn.size.height, btn.size.width, 0);
            self.layer.shadowOffset = CGSizeMake(-5, 5);
        }
        
        self.layer.masksToBounds = NO;
        self.layer.cornerRadius = 8;
        self.layer.shadowRadius = 5;
        self.layer.shadowOpacity = 0.5;
        
        table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, btn.size.width, 0)];
        table.delegate = self;
        table.dataSource = self;
        table.layer.cornerRadius = 5;
        table.backgroundColor = [UIColor clearColor];
        table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        table.separatorColor = [UIColor blackColor];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        if ([direction isEqualToString:@"up"]) {
            self.frame = CGRectMake(btn.origin.x, btn.origin.y-height+20, btn.size.width, height);
        } else if([direction isEqualToString:@"down"]) {
            self.frame = CGRectMake(btn.origin.x, btn.origin.y+btn.size.height, btn.size.width, height);
        }
        table.frame = CGRectMake(0, 0, btn.size.width, height);
        [UIView commitAnimations];
        [b.superview addSubview:self];
        [self addSubview:table];
         self.layer.zPosition = 1;
    }
    return self;
}
/** 
 
*/

- (id)showDropDownWithHeight:(UIButton *)b :(NSArray *)arr :(NSArray *)imgArr :(NSString *)direction :(CGFloat) height{
    btnSender = b;
    //CGFloat height = 100.0;
    animationDirection = direction;
    self.table = (UITableView *)[super init];
    if (self) {
        // Initialization code
        CGRect btn = b.frame;
        TempFrame = b.frame;
        self.list = [NSArray arrayWithArray:arr];
        self.imageList = [NSArray arrayWithArray:imgArr];
        if ([direction isEqualToString:@"up"]) {
            self.frame = CGRectMake(btn.origin.x, btn.origin.y, btn.size.width, 0);
            self.layer.shadowOffset = CGSizeMake(-5, -5);
        }else if ([direction isEqualToString:@"down"]) {
            self.frame = CGRectMake(btn.origin.x, btn.origin.y+btn.size.height, btn.size.width, 0);
            self.layer.shadowOffset = CGSizeMake(-5, 5);
        }
        
        self.layer.masksToBounds = NO;
        self.layer.cornerRadius = 8;
        self.layer.shadowRadius = 5;
        self.layer.shadowOpacity = 0.5;
        
        table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, btn.size.width, 0)];
        table.delegate = self;
        table.dataSource = self;
        table.layer.cornerRadius = 5;
        table.backgroundColor = [UIColor clearColor];
        table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        table.separatorColor = [UIColor blackColor];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        if ([direction isEqualToString:@"up"]) {
            self.frame = CGRectMake(btn.origin.x, btn.origin.y-height+20, btn.size.width, height);
        } else if([direction isEqualToString:@"down"]) {
            self.frame = CGRectMake(btn.origin.x, btn.origin.y+btn.size.height, btn.size.width, height);
        }
        table.frame = CGRectMake(0, 0, btn.size.width, height);
        [UIView commitAnimations];
        [b.superview addSubview:self];
        [self addSubview:table];
        self.layer.zPosition = 1;
    }
    return self;
}
- (id)showDropDownWithHeightOFButtonTopFrame:(UIButton *)b :(NSArray *)arr :(NSArray *)imgArr :(NSString *)direction :(CGFloat) height{
    btnSender = b;
    //CGFloat height = 100.0;
    animationDirection = direction;
    self.table = (UITableView *)[super init];
    if (self) {
        // Initialization code
        CGRect btn = b.frame;
        TempFrame = b.frame;
        self.list = [NSArray arrayWithArray:arr];
        self.imageList = [NSArray arrayWithArray:imgArr];
        if ([direction isEqualToString:@"up"]) {
            self.frame = CGRectMake(btn.origin.x, btn.origin.y, btn.size.width,0);
            self.layer.shadowOffset = CGSizeMake(-5, -5);
        }else if ([direction isEqualToString:@"down"]) {
            self.frame = CGRectMake(btn.origin.x, btn.origin.y+btn.size.height, btn.size.width, 0);
            self.layer.shadowOffset = CGSizeMake(-5, 5);
        }
        
        self.layer.masksToBounds = NO;
        self.layer.cornerRadius = 8;
        self.layer.shadowRadius = 5;
        self.layer.shadowOpacity = 0.5;
        
        table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, btn.size.width, 0)];
        table.delegate = self;
        table.dataSource = self;
        table.layer.cornerRadius = 5;
        table.backgroundColor = [UIColor clearColor];
        table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        table.separatorColor = [UIColor blackColor];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        if ([direction isEqualToString:@"up"]) {
            self.frame = CGRectMake(btn.origin.x, btn.origin.y-height+20, btn.size.width, height);
        } else if([direction isEqualToString:@"down"]) {
            self.frame = CGRectMake(btn.origin.x, btn.origin.y+btn.size.height, btn.size.width, height);
        }
        table.frame = CGRectMake(0,0, btn.size.width, height);
       
        [UIView commitAnimations];
        [b.superview addSubview:self];
        [self addSubview:table];
       
    }
    return self;
}
-(void)hideDropDown:(UIButton *)b {
    CGRect btn = btnSender.frame;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    if ([animationDirection isEqualToString:@"up"]) {
        self.frame = CGRectMake(btn.origin.x, btn.origin.y, btn.size.width, 0);
    }else if ([animationDirection isEqualToString:@"down"]) {
        self.frame = CGRectMake(btn.origin.x, btn.origin.y+btn.size.height, btn.size.width, 0);
    }
    table.frame = CGRectMake(0, 0, btn.size.width, 0);
    [UIView commitAnimations];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.list count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont fontWithName:@"FuturaBT-Book"size:14];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
    }
    if ([self.imageList count] == [self.list count]) {
        cell.textLabel.text =[list objectAtIndex:indexPath.row];
        cell.imageView.image = [imageList objectAtIndex:indexPath.row];
    } else if ([self.imageList count] > [self.list count]) {
        cell.textLabel.text =[list objectAtIndex:indexPath.row];
        if (indexPath.row < [imageList count]) {
            cell.imageView.image = [imageList objectAtIndex:indexPath.row];
        }
    } else if ([self.imageList count] < [self.list count]) {
        if (is_TimeDisplay){
            int minutes = (int)[[list objectAtIndex:indexPath.row] integerValue];
            NSString *timeString ;
            if (minutes >110) {
                int hour = minutes / 60;
                int min = minutes % 60;
                timeString = [NSString stringWithFormat: @"%d:%02d hr", hour, min];
            }else{
                timeString = [NSString stringWithFormat: @"%d min", minutes];
            }
            cell.textLabel.text = timeString;
        }else{
            cell.textLabel.text = [list objectAtIndex:indexPath.row];
        }
        if (indexPath.row < [imageList count]) {
            cell.imageView.image = [imageList objectAtIndex:indexPath.row];
        }
    }
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.textColor = [UIColor blackColor];
    /*UIView * v = [[UIView alloc] init];
    v.backgroundColor = [UIColor grayColor];
    cell.selectedBackgroundView = v;*/
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self hideDropDown:btnSender];
    
   // UITableViewCell *c = [tableView cellForRowAtIndexPath:indexPath];
    //[btnSender setTitle:c.textLabel.text forState:UIControlStateNormal];
    //[self.delegate niDropSelectedSring:c.textLabel.text];
    [self.delegate niDropSelectedSring:[list objectAtIndex:indexPath.row] withIndex:[NSString stringWithFormat:@"%ld",(long)indexPath.row + 1]];
//    for (UIView *subview in btnSender.subviews) {
//        if ([subview isKindOfClass:[UIImageView class]]) {
//            [subview removeFromSuperview];
//        }
//    }
//    imgView.image = c.imageView.image;
//    imgView = [[UIImageView alloc] initWithImage:c.imageView.image];
//    imgView.frame = CGRectMake(5, 5, 25, 25);
//    [btnSender addSubview:imgView];
    [self myDelegate];
}

- (void) myDelegate {
    [self.delegate niDropDownDelegateMethod:self];
}

-(void)dealloc {
//    [super dealloc];
//    [table release];
//    [self release];
}

@end
