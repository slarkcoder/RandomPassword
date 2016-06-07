//
//  ViewController.m
//  helloworld
//
//  Created by 张超 on 16/6/7.
//  Copyright © 2016年 slark. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()
@property (nonatomic, assign) BOOL isSelectChar;
@property (nonatomic, assign) BOOL isSelectNumber;
@property (nonatomic, assign) BOOL isSelectSpecChar;
@property (nonatomic, strong) NSMutableArray *charArray; //密码取值范围
@property (weak) IBOutlet NSTextField *passwordTextfield;
@property (weak) IBOutlet NSSlider *passwordLengthSlider;
@property (weak) IBOutlet NSTextField *passwordLengthLabel;
@end

@implementation ViewController

/**
 *  @author zhangchao, 16-06-07 17:06:54
 *
 *  选择字母
 *
 *  @since 1.0
 */
- (IBAction)selectCharButton:(NSButton *)sender {
    self.isSelectChar = !self.isSelectChar;
}

/**
 *  @author zhangchao, 16-06-07 17:06:12
 *
 *  选择数字
 *
 *  @since 1.0
 */
- (IBAction)selectNumberButton:(NSButton *)sender {
    self.isSelectNumber = !self.isSelectNumber;
}

/**
 *  @author zhangchao, 16-06-07 17:06:22
 *
 *  选择特殊字符
 *
 *  @since 1.0
 */
- (IBAction)selectSpecCharButton:(NSButton *)sender {
    self.isSelectSpecChar = !self.isSelectSpecChar;
}

/**
 *  @author zhangchao, 16-06-07 17:06:06
 *
 *  设置密码长度
 *
 *  @since 1.0
 */
- (IBAction)passwordSlider:(NSSlider *)sender {
    self.passwordLengthLabel.stringValue = [NSString stringWithFormat:@"%ld",self.passwordLengthSlider.integerValue];
}

- (IBAction)makeButton:(NSButton *)sender {
    
    if (!self.isSelectSpecChar && !self.isSelectNumber && !self.isSelectSpecChar) {
        return;
    }
    
    self.charArray = [[NSMutableArray alloc] init];
    
    if(self.isSelectChar){
        [self.charArray addObjectsFromArray:@[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"g",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"G",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"]];
    }
    
    if(self.isSelectNumber){
        [self.charArray addObjectsFromArray:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"]];
    }
    
    if(self.isSelectSpecChar){
        [self.charArray addObjectsFromArray:@[@"@",@"#",@"$",@"%",@"^",@"&"]];
    }
    
    NSString *password = [[NSString alloc] init];
    
    for (NSInteger i = 0 ; i < self.passwordLengthSlider.integerValue; i++) {
        password = [password stringByAppendingString:self.charArray[arc4random()%self.charArray.count]];
    }
    
    NSLog(@"%@",password);
    
    self.passwordTextfield.stringValue = password;
    
    [[NSPasteboard generalPasteboard] declareTypes:[NSArray arrayWithObject:NSStringPboardType] owner:nil];
    [[NSPasteboard generalPasteboard] setString:password forType:NSStringPboardType];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.isSelectChar = YES;
    self.isSelectNumber = YES;
    self.isSelectSpecChar = YES;
    
    self.passwordLengthLabel.stringValue = [NSString stringWithFormat:@"%ld",self.passwordLengthSlider.integerValue];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
