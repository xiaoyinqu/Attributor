//
//  ViewController.m
//  Attributor
//
//  Created by QuXiaoyin on 1/11/15.
//  Copyright (c) 2015 QuXiaoyin. All rights reserved.
//

#import "ViewController.h"
#import "TextStatsViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *outlineBUtton;
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UILabel *headline;

@end

@implementation ViewController
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"analyzeText"]){
        if ([segue.destinationViewController isKindOfClass:[TextStatsViewController class]]){
            TextStatsViewController *tsvc = (TextStatsViewController *)segue.destinationViewController;
            tsvc.textToAnalyze = self.body.textStorage;
        }
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:self.outlineBUtton.currentTitle];
    [title setAttributes: @{NSStrokeColorAttributeName:self.outlineBUtton.tintColor, NSStrokeWidthAttributeName: @3} range:NSMakeRange(0,[title length])];
    [self.outlineBUtton setAttributedTitle:title forState:UIControlStateNormal];
    
}

-(void)usePreferredFonts{
    self.body.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.headline.font=[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline
                        ];}


    
    
    


- (IBAction)unoutline {
    [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName range:self.body.selectedRange];
    
}
- (IBAction)outlineBodySelection{
    [self.body.textStorage addAttributes: @{NSStrokeColorAttributeName:[UIColor blackColor], NSStrokeWidthAttributeName: @-3} range:self.body.selectedRange];
}
- (IBAction)ChangeBackgroundSelectorToMatchButtonColor:(UIButton *)sender {
    [self.body.textStorage addAttribute:NSBackgroundColorAttributeName value:sender.backgroundColor range:self.body.selectedRange];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
