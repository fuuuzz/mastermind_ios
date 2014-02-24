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


@synthesize resultLabel, resultLabel2, resultLabel3;
@synthesize  blueButton, orangeButton, roseButton, greenButton, recup1, recup2, recup3, recup4, button0line0, button1line0, button2line0, button3line0, button0line1, button1line1, button2line1, button3line1, button0line2, button1line2, button2line2, button3line2, button0line3, button1line3, button2line3, button3line3;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    currentButton = 4;
    
    int i = 0;
    
    numberOfSubmit = 0;
    
//    result[0] = arc4random() %4;
//    result[1] = arc4random() %4;
//    result[2] = arc4random() %4;
//    result[3] = arc4random() %4;

    result[0] = 1;
    result[1] = 2;
    result[2] = 0;
    result[3] = 2;
    
    NSLog(@"%d" @"%d" @"%d" @"%d", result[0], result[1], result[2], result[3]);
    
    //make alle button circle
    styleButton = [NSArray arrayWithObjects:blueButton, orangeButton, roseButton, greenButton,recup1, recup2, recup3, recup4, button0line0, button1line0, button2line0, button3line0, button0line1, button1line1, button2line1, button3line1, nil];
    
    for (i = 0; i < 16; i++) {
        myCurrentButton = [styleButton objectAtIndex:i];
        myCurrentButton.layer.cornerRadius = 15;
        if (i >= 4 && i <= 7) { //borderColor to black to reciver buttons
            [myCurrentButton.layer setBorderWidth:1.0];
            [myCurrentButton.layer setBorderColor:[[UIColor blackColor] CGColor]];
        }
    }
    
    histoTab1 = [[NSArray alloc]init];
//    NSMutableArray *histoTabJ = [[NSMutableArray alloc]init];
//    [histoTab addObject:histoTabJ];

    
//    histoTab = [NSMutableArray init];

//    result[0] = 2;
//    result[1] = 0;
//    result[2] = 0;
//    result[3] = 2;

    
//    [label1 setText:[[NSString alloc] initWithFormat:@"%d", result[0]]];
//    [label2 setText:[[NSString alloc] initWithFormat:@"%d", result[1]]];
//    [label3 setText:[[NSString alloc] initWithFormat:@"%d", result[2]]];
//    [label4 setText:[[NSString alloc] initWithFormat:@"%d", result[3]]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)createRandom:(id)sender {
    
    numberOfSubmit++;
    
     NSLog(@"%d" @"%d" @"%d" @"%d", recup[0], recup[1], recup[2], recup[3]);
    
    int i;
    int j;
    
    int good = 0;
    int wrong = 0;
    
    
    int isUsed[4];
    NSLog(@"%d %d %d %d", isUsed[0], isUsed[1], isUsed[2], isUsed[3]);
    
    for (i = 0; i < 4; i++) {
        isUsed[i] = 0;
    }
    
    
//    NSString * s1 = [field1 text];
//    NSString * s2 = [field2 text];
//    NSString * s3 = [field3 text];
//    NSString * s4 = [field4 text];
    
//    input[0] = [s1 intValue];
//    input[1] = [s2 intValue];
//    input[2] = [s3 intValue];
//    input[3] = [s4 intValue];
    
    for (i = 0; i < 4; i++) {//blanc
        int rightSpot = -1;
        int wrongSpot = -1;
        for (j = 0; j < 4; j++) {
            if (recup[i] == result[j]){
                if (i == j) {
                    rightSpot = j;
                }
                else if(isUsed[j] != 2){
                    wrongSpot = i;
                }
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
//        NSLog(@"%d", isUsed[i]);
        if (isUsed[i] == 2) {
            good++;
        }
        else if (isUsed[i] == 1){
            wrong++;
        }
        NSLog(@"%d", wrong);
    }
    
    NSString * goodString = [[NSString alloc]initWithFormat:@"%d", good];
    NSString * wrongString = [[NSString alloc]initWithFormat:@"%d", wrong];
//    NSString * finalScore = [[NSString alloc]initWithFormat:@"%d", score];
    
    resultLabel.text = [NSString stringWithFormat:@"Right spots %@", goodString];
    resultLabel2.text = [NSString stringWithFormat:@"Wrong spots %@", wrongString];
    
    currentColorTab = [NSArray arrayWithObjects:recup1, recup2, recup3, recup4, nil];
    
    //essayer sans le i et avec  histoTab[numberOfSubmit - i][j]
    
        for (j = 0; j < 4; j++) {
            currentCell = currentColorTab[j];
            currentColor = currentCell.backgroundColor;
            histoTab[numberOfSubmit - 1][j] = [UIButton buttonWithType:UIButtonTypeCustom];
            histoTab[numberOfSubmit - 1][j].frame = CGRectMake((50.0 + j*40), (350.0), 30.0, 30.0);
            histoTab[numberOfSubmit - 1][j].layer.cornerRadius = 15;
            [self.view addSubview:histoTab[numberOfSubmit - 1][j]];
            [histoTab[numberOfSubmit-1][j] setBackgroundColor:currentColor];
//            if (numberOfSubmit >= 2) {
                histoTab[numberOfSubmit - 1][j].frame = CGRectMake((77.0 + j*40), (374.0 - numberOfSubmit*38), 30.0, 30.0);
//                histoTab[numberOfSubmit - 1][j].frame = CGRectMake((50.0 + j*40), 300.0, 30.0, 30.0);
                currentCell = currentColorTab[j];
                [histoTab[numberOfSubmit-1][j] setBackgroundColor:currentColor];
//            }
        }
   
//    if (good == 4) {
//        resultLabel3.text = finalScore;
//    }
    
//    currentColorTab = [NSArray arrayWithObjects:recup1, recup2, recup3, recup4, nil];
//    
//    histoTab1 = [NSArray arrayWithObjects:button0line0, button1line0, button2line0, button3line0, nil];
//    
//    histoTab2 = [NSArray arrayWithObjects:button0line1, button1line1, button2line1, button3line1, nil];
//    
//    histoTab3 = [NSArray arrayWithObjects:button0line2, button1line2, button2line2, button3line2, nil];
//    
//    histoTab4 = [NSArray arrayWithObjects:button0line3, button1line3, button2line3, button3line3, nil];
//
//        for (j = 0; j < 4; j++) {
//            if (numberOfSubmit >= 4) {
//                currentCell = histoTab3[j];
//                currentColor = currentCell.backgroundColor;
//                [histoTab4[j] setBackgroundColor:currentColor];
//                currentCell = histoTab4[j];
//                currentCell.layer.cornerRadius = 15;
//            }
//            if (numberOfSubmit >= 3) {
//                currentCell = histoTab2[j];
//                currentColor = currentCell.backgroundColor;
//                [histoTab3[j] setBackgroundColor:currentColor];
//                currentCell = histoTab3[j];
//                currentCell.layer.cornerRadius = 15;
//            }
//            if (numberOfSubmit >= 2) {
//                currentCell = histoTab1[j];
//                currentColor = currentCell.backgroundColor;
//                [histoTab2[j] setBackgroundColor:currentColor];
//                currentCell = histoTab2[j];
//                currentCell.layer.cornerRadius = 15;
//            }
//            currentCell = currentColorTab[j];
//            currentColor = currentCell.backgroundColor;
//            [histoTab1[j] setBackgroundColor:currentColor];
//            currentCell = histoTab1[j];
//            currentCell.layer.cornerRadius = 15;
//        }
    
//    for (j = 0; j < 4; j++) {
//        if (numberOfSubmit > 1) {
//            currentCell = histoTab1[j];
//            currentColor = currentCell.backgroundColor;
//            [histoTab2[j] setBackgroundColor:currentColor];
//            currentCell = histoTab2[j];
//            currentCell.layer.cornerRadius = 15;
//        }
//    }
    
//    
//    currentCell = histoTab1[0];
//    NSLog(@"%f", currentCell.frame.origin.y);
//    
//    currentCell = currentColorTab[2];
//    NSLog(@"%f", currentCell.frame.origin.y);
//    
    
    
    
    
//    currentCell = currentColorTab[0];
//    NSLog(@"%f", currentCell.frame.origin.y);

    
//    for (i = 0; i < numberOfSubmit; i++) {
//        for (j = 0; j < 4; j++) {
//            currentCell = [[histoTab objectAtIndex:i] objectAtIndex:j];
//            CGRect btFrame = currentCell.frame;
//            btFrame.origin.y = 337 + i*-38.2;
//            [UIView animateWithDuration:1.25 animations:^{
//                currentCell.frame = btFrame;
//            }];
//            
//        }
//    }
    
//    currentCell = histoTab[0][0];
//    NSLog(@"%f", currentCell.frame.origin.y);
    
    
    
//    rightSpot = 0;
//    wrongSpot = 0;
//    
//    isUsed1 = false;
//    isUsed2 = false;
//    isUsed3 = false;
//    isUsed4 = false;
//
//    NSString * n1 = [field1 text];
//    NSString * n2 = [field2 text];
//    NSString * n3 = [field3 text];
//    NSString * n4 = [field4 text];
//    
//
//    
//    if ([n1 isEqualToString:resultR1]) {
//        rightSpot += 1;
//        isUsed1 = true;
//    }else if( [n1 isEqualToString:resultR2] || [n1 isEqualToString:resultR3] || [n1 isEqualToString:resultR2]){
//        wrongSpot += 1;
//    }
//    
//    if ([n2 isEqualToString:resultR2]) {
//        rightSpot += 1;
//        isUsed2 = true;
//    }else if([n2 isEqualToString:resultR1] & !isUsed1 || [n2 isEqualToString:resultR3] & !isUsed1 || [n2 isEqualToString:resultR4]) {
//        wrongSpot += 1;
//    }
//    
//    if ([n3 isEqualToString:resultR3]) {
//        rightSpot += 1;
//        isUsed3 = true;
//    }else if([n3 isEqualToString:resultR1] || [n3 isEqualToString:resultR2] || [n3 isEqualToString:resultR4]) {
//        wrongSpot += 1;
//    }
//    
//    if ([n4 isEqualToString:resultR4]) {
//        rightSpot += 1;
//        isUsed4 = true;
//    }else if([n4 isEqualToString:resultR1] || [n4 isEqualToString:resultR2] || [n4 isEqualToString:resultR3]) {
//        wrongSpot += 1;
//    }
//    
//    NSString * right = [[NSString alloc]initWithFormat:@"%d", rightSpot];
//    NSString * wrong = [[NSString alloc]initWithFormat:@"%d", wrongSpot];
//    
//    resultLabel.text = [NSString stringWithFormat:@"Right spots %@", right];
//    resultLabel2.text = [NSString stringWithFormat:@"Wrong spots %@", wrong];
    
    
    
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
}

- (IBAction)recup2:(id)sender {
    myButton = sender;
    [myButton setBackgroundColor:currentColor];
    recup[1] = currentButton;
}

- (IBAction)recup3:(id)sender {
    myButton = sender;
    [myButton setBackgroundColor:currentColor];
    recup[2] = currentButton;
}

- (IBAction)recup4:(id)sender {
    myButton = sender;
    [myButton setBackgroundColor:currentColor];
    recup[3] = currentButton;
}

@end
