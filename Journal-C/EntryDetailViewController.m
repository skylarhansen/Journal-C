//
//  EntryDetailViewController.m
//  Journal-C
//
//  Created by Skylar Hansen on 5/31/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

#import "EntryDetailViewController.h"
#import "EntryController.h"

@interface EntryDetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@end

@implementation EntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateWithEntry:self.entry];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return true;
}

- (void)updateWithEntry:(Entry *)entry {
    
    if (entry) {
        self.entry = entry;
        self.titleTextField = self.entry.title;
        self.bodyTextView = self.entry.text;
    }
}

- (IBAction)clearButtonTapped:(id)sender {
    
    self.titleTextField.text = @"";
    self.bodyTextView.text = @"";
    
}

- (IBAction)saveButtonTapped:(id)sender {
    
    if (self.entry) {
        self.entry.title = self.titleTextField.text;
        self.entry.text = self.bodyTextView.text;
    } else {
        
        Entry *entry = [[Entry alloc]initWithTitle:self.titleTextField.text andText:self.bodyTextView.text];
        [[EntryController sharedInstance] addEntry:entry];
        
        self.entry = entry;
    }
    
    [self.navigationController popViewControllerAnimated:true];
}

@end
