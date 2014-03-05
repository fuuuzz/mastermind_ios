//
//  ViewController.m
//  Mastermind2
//
//  Created by Fuzz on 18/02/2014.
//  Copyright (c) 2014 Fuzz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize  blueButton, orangeButton, roseButton, greenButton, recup1, recup2, recup3, recup4, retry, megaHeader, score;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [retry setHidden:true];
    [score setHidden:true];
    currentButton = 4;

    int i = 0;
    
    numberOfSubmit = 0;
    
    result[0] = arc4random() %4;
    result[1] = arc4random() %4;
    result[2] = arc4random() %4;
    result[3] = arc4random() %4;
    
    for (i = 0; i < 4; i++) {
        NSLog(@"%d", result[i]);
    }
    //make alle button circle
    styleButton = [NSArray arrayWithObjects:blueButton, orangeButton, roseButton, greenButton,recup1, recup2, recup3, recup4, nil];
    
    for (i = 0; i < 8; i++) {
        myCurrentButton = [styleButton objectAtIndex:i];
        myCurrentButton.layer.cornerRadius = 15;
        if (i >= 4 && i <= 7) { //borderColor to black to reciver buttons
            [myCurrentButton.layer setBorderWidth:1.0];
            [myCurrentButton.layer setBorderColor:[[UIColor blackColor] CGColor]];
        }
    }
    


    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)createRandom:(id)sender {
    
    if (isClicked < 4) {
        alert = [[UIAlertView alloc]initWithTitle: @"Dude..."
                                          message: @"You need to fill 4 buttons..."
                                         delegate: self
                                cancelButtonTitle:@"Cancel"
                                otherButtonTitles:@"OK",nil];
        [alert show];
    } else if (numberOfSubmit == 10) {
        [megaHeader setHidden:true];
        [retry setHidden:false];
    }
        
    
    else {
    
        numberOfSubmit++;
    
        int i;
        int j;
    
        int good = 0;
        int wrong = 0;

        int isUsed[4];
        isUsed[0] = 0;
        isUsed[1] = 0;
        isUsed[2] = 0;
        isUsed[3] = 0;
    
        
        for (i = 0; i < 4; i++) {
            int rightSpot = -1;
            int wrongSpot = -1;
            for (j = 0; j < 4; j++) {
                if (recup[j] == result[i]){
                    if (i == j)
                        rightSpot = j;
                    else if ( i != j)
                        wrongSpot = i;
                }
            }
        
        
            if (rightSpot != -1)
                isUsed[rightSpot] = 2;
            else if (wrongSpot != -1)
                isUsed[wrongSpot] = 1;
        
        }
    
        good = 0;
        wrong = 0;
    
        for (i = 0; i < 4; i++) {
        
            if (isUsed[i] == 2) {
                good++;
            }
            else if (isUsed[i] == 1){
                wrong++;
            }
        }
        
        NSLog(@"%d", good);
        NSLog(@"%d", wrong);
        
        
    
    currentColorTab = [NSArray arrayWithObjects:recup1, recup2, recup3, recup4, nil];
        
        //tableau des historiques
        for (j = 0; j < 4; j++) {
            currentCell = currentColorTab[j];
            currentColor = currentCell.backgroundColor;
            histoTab[numberOfSubmit - 1][j] = [UIButton buttonWithType:UIButtonTypeCustom];
            histoTab[numberOfSubmit - 1][j].frame = CGRectMake((50.0 + j*40), (350.0), 30.0, 30.0);
            histoTab[numberOfSubmit - 1][j].layer.cornerRadius = 15;
            [self.view addSubview:histoTab[numberOfSubmit - 1][j]];
            [histoTab[numberOfSubmit-1][j] setBackgroundColor:currentColor];
            histoTab[numberOfSubmit - 1][j].frame = CGRectMake((111.0 + j*38), (485.0 - numberOfSubmit*38), 30.0, 30.0);
            [histoTab[numberOfSubmit-1][j] setBackgroundColor:currentColor];
        }
        
        //tableau des pions bien ou mal placés.
        for (j = 0; j < good; j++) {
            histoSpot[numberOfSubmit - 1][j] = [UIButton buttonWithType:UIButtonTypeCustom];
            histoSpot[numberOfSubmit - 1][j].frame = CGRectMake((6.0 + j*40), (350.0), 15.0, 15.0);
            histoSpot[numberOfSubmit - 1][j].layer.cornerRadius = 7.5;
            [self.view addSubview:histoSpot[numberOfSubmit - 1][j]];
            [histoSpot[numberOfSubmit - 1][j] setBackgroundColor:[UIColor blackColor]];
            histoSpot[numberOfSubmit - 1][j].frame = CGRectMake((6.0 + j*20), (492.0 - numberOfSubmit*38), 15.0, 15.0);
        }
        for (j = good; j < good + wrong; j++) {
            histoSpot[numberOfSubmit - 1][j] = [UIButton buttonWithType:UIButtonTypeCustom];
            histoSpot[numberOfSubmit - 1][j].frame = CGRectMake((6.0 + j*40), (350.0), 15.0, 15.0);
            histoSpot[numberOfSubmit - 1][j].layer.cornerRadius = 7.5;
            [self.view addSubview:histoSpot[numberOfSubmit - 1][j]];
            [histoSpot[numberOfSubmit - 1][j] setBackgroundColor:[UIColor whiteColor]];
            histoSpot[numberOfSubmit - 1][j].frame = CGRectMake((6.0 + j*20), (492.0 - numberOfSubmit*38), 15.0, 15.0);
            [histoSpot[numberOfSubmit - 1][j].layer setBorderWidth:1.0];
            [histoSpot[numberOfSubmit - 1][j].layer setBorderColor:[[UIColor blackColor] CGColor]];
        }
        
        if (good == 4) {
            
            NSString *scoreNum = [[NSString alloc]initWithFormat:@"Score: %d", numberOfSubmit];
            [score setText:scoreNum];
            [megaHeader setHidden:true];
            [retry setHidden:false];
            [score setHidden:false];
        }
        
    }
    
}


- (IBAction)retry:(id)sender {
}

- (IBAction)blueButton:(id)sender {
    currentButton = 0;
    currentColor = [UIColor colorWithRed:(61.0/255.0) green:(165.0/255.0) blue:(255.0/255.0) alpha:(1.0)];
}

- (IBAction)orangeButton:(id)sender {
    currentButton = 1;
    currentColor = [UIColor colorWithRed:(255.0/255.0) green:(204.0/255.0) blue:(102.0/255.0) alpha:(1.0)];
}

- (IBAction)roseButton:(id)sender {
    currentButton = 2;
    currentColor = [UIColor colorWithRed:(255.0/255.0) green:(0.0/255.0) blue:(128.0/255.0) alpha:(1.0)];
}

- (IBAction)greenButton:(id)sender {
    currentButton = 3;
    currentColor = [UIColor colorWithRed:(102.0/255.0) green:(255.0/255.0) blue:(102.0/255.0) alpha:(1.0)];
}


- (IBAction)recup1:(id)sender {
    myButton = sender;
    [myButton setBackgroundColor:currentColor];
    recup[0] = currentButton;
    isClicked++;
}

- (IBAction)recup2:(id)sender {
    myButton = sender;
    [myButton setBackgroundColor:currentColor];
    recup[1] = currentButton;
    isClicked++;
}

- (IBAction)recup3:(id)sender {
    myButton = sender;
    [myButton setBackgroundColor:currentColor];
    recup[2] = currentButton;
    isClicked++;
}

- (IBAction)recup4:(id)sender {
    myButton = sender;
    [myButton setBackgroundColor:currentColor];
    recup[3] = currentButton;
    isClicked++;
}
@end
