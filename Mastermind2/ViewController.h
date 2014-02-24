//
//  ViewController.h
//  Mastermind2
//
//  Created by Fuzz on 18/02/2014.
//  Copyright (c) 2014 Fuzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    int result[4];//array of random number
    
    int currentButton;//we'll use button to link color and number
    UIColor * currentColor;
    UIColor * randomColor;
    UIButton * myButton;
    UIButton * myCurrentButton;
    int recup[4];//array of number linked to color
    
    NSArray *styleButton;
    NSArray *currentColorTab;
    NSArray *currentColorTab2;
    NSArray *histoTab1;
    NSArray *histoTab2;
    NSArray *histoTab3;
    NSArray *histoTab4;
    
    UIButton *histoTab[4][4];
    
    int numberOfSubmit;
    
    UIButton *currentCellTest;
    UIButton *currentCell;

}
- (IBAction)createRandom:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *testButton;

@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel2;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel3;

//initializing button style in viewdidlod
@property (strong, nonatomic) IBOutlet UIButton *blueButton;
@property (strong, nonatomic) IBOutlet UIButton *orangeButton;
@property (strong, nonatomic) IBOutlet UIButton *roseButton;
@property (strong, nonatomic) IBOutlet UIButton *greenButton;
@property (strong, nonatomic) IBOutlet UIButton *recup1;
@property (strong, nonatomic) IBOutlet UIButton *recup2;
@property (strong, nonatomic) IBOutlet UIButton *recup3;
@property (strong, nonatomic) IBOutlet UIButton *recup4;
@property (strong, nonatomic) IBOutlet UIButton *button0line0;
@property (strong, nonatomic) IBOutlet UIButton *button1line0;
@property (strong, nonatomic) IBOutlet UIButton *button2line0;
@property (strong, nonatomic) IBOutlet UIButton *button3line0;
@property (strong, nonatomic) IBOutlet UIButton *button0line1;
@property (strong, nonatomic) IBOutlet UIButton *button1line1;
@property (strong, nonatomic) IBOutlet UIButton *button2line1;
@property (strong, nonatomic) IBOutlet UIButton *button3line1;
@property (strong, nonatomic) IBOutlet UIButton *button0line2;
@property (strong, nonatomic) IBOutlet UIButton *button1line2;
@property (strong, nonatomic) IBOutlet UIButton *button2line2;
@property (strong, nonatomic) IBOutlet UIButton *button3line2;
@property (strong, nonatomic) IBOutlet UIButton *button0line3;
@property (strong, nonatomic) IBOutlet UIButton *button1line3;
@property (strong, nonatomic) IBOutlet UIButton *button2line3;
@property (strong, nonatomic) IBOutlet UIButton *button3line3;


- (IBAction)blueButton:(id)sender;;
- (IBAction)orangeButton:(id)sender;
- (IBAction)roseButton:(id)sender;
- (IBAction)greenButton:(id)sender;

- (IBAction)recup1:(id)sender;
- (IBAction)recup2:(id)sender;
- (IBAction)recup3:(id)sender;
- (IBAction)recup4:(id)sender;

@end
