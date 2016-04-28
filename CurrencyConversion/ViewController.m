//
//  ViewController.m
//  CurrencyConversion
//
//  Created by Eduardo Aranega on 4/27/16.
//  Copyright © 2016 Eduardo Aranega. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>

@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *currencyA;
@property (weak, nonatomic) IBOutlet UILabel *currencyB;
@property (weak, nonatomic) IBOutlet UILabel *currencyC;

@property (nonatomic) CRCurrencyRequest *req;

@end

@implementation ViewController

- (IBAction)buttonTapped:(id)sender {

    self.convertButton.enabled = NO;

    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];

}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies {

    self.convertButton.enabled = YES;

    double inputValue = [self.inputField.text floatValue];

    double euroValue = inputValue * currencies.EUR;
    NSString *temp = [NSString stringWithFormat:@"%.2f", euroValue];
    self.currencyA.text = temp;

    double yenValue = inputValue * currencies.JPY;
    temp = [NSString stringWithFormat:@"%.2f", yenValue];
    self.currencyB.text = temp;

    double poundValue = inputValue * currencies.GBP;
    temp = [NSString stringWithFormat:@"%.2f", poundValue];
    self.currencyC.text = temp;
}

@end
