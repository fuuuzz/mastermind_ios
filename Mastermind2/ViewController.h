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
    
    int isClicked;
    UIAlertView *alert;
    
    NSArray *styleButton;
    NSArray *currentColorTab;
    NSArray *currentColorTab2;
    
    
    UIButton *histoTab[11][4];
    UIButton *histoSpot[11][4];
    
    int numberOfSubmit;
    
    UIButton *currentCellTest;
    UIButton *currentCell;

}
- (IBAction)createRandom:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *testButton;

//initializing button style in viewdidlod
@property (strong, nonatomic) IBOutlet UIButton *blueButton;
@property (strong, nonatomic) IBOutlet UIButton *orangeButton;
@property (strong, nonatomic) IBOutlet UIButton *roseButton;
@property (strong, nonatomic) IBOutlet UIButton *greenButton;
@property (strong, nonatomic) IBOutlet UIButton *recup1;
@property (strong, nonatomic) IBOutlet UIButton *recup2;
@property (strong, nonatomic) IBOutlet UIButton *recup3;
@property (strong, nonatomic) IBOutlet UIButton *recup4;

@property (strong, nonatomic) IBOutlet UIButton *retry;
@property (strong, nonatomic) IBOutlet UILabel *megaHeader;
@property (strong, nonatomic) IBOutlet UILabel *score;

- (IBAction)blueButton:(id)sender;;
- (IBAction)orangeButton:(id)sender;
- (IBAction)roseButton:(id)sender;
- (IBAction)greenButton:(id)sender;
//
//- (IBAction)recup1:(id)sender;
//- (IBAction)recup2:(id)sender;
//- (IBAction)recup3:(id)sender;
//- (IBAction)recup4:(id)sender;

- (IBAction)recup1:(id)sender;
- (IBAction)recup2:(id)sender;
- (IBAction)recup3:(id)sender;
- (IBAction)recup4:(id)sender;


@end
