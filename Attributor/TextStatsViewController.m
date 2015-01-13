//
//  TextStatsViewController.m
//  Attributor
//
//  Created by QuXiaoyin on 1/12/15.
//  Copyright (c) 2015 QuXiaoyin. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *outlinedCharactersLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorfulCharacterLabel;

@end

@implementation TextStatsViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.textToAnalyze = [[NSAttributedString alloc] initWithString:@"test" attributes:@{NSForegroundColorAttributeName: [UIColor greenColor], NSStrokeWidthAttributeName: @-3}]; 
}

-(void)setTextToAnalyze:(NSAttributedString *)textToAnalyze

{   _textToAnalyze =textToAnalyze;
    if (self.view.window)[self updateUI];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


-(void)updateUI{
    self.colorfulCharacterLabel.text = [NSString stringWithFormat:@"%lu Colorful Characters",(unsigned long)[[self charactersWithAttibutes:NSForegroundColorAttributeName]length]];
    
    self.outlinedCharactersLabel.text= [NSString stringWithFormat:@"%lu Outlined Characters",(unsigned long)[[self charactersWithAttibutes: NSStrokeWidthAttributeName] length]];
}


-(NSAttributedString *)charactersWithAttibutes:(NSString *)attributeName
{
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc]init];
    NSUInteger index = 0;
    while (index < [self.textToAnalyze length]){
        NSRange range;
        id value  = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if (value){
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.location + range.length;}
        else {
            index ++;
        }
    } return characters;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
