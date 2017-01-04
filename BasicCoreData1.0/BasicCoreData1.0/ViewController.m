//
//  ViewController.m
//  BasicCoreData1.0
//
//  Created by trunghoangdang on 11/22/16.
//  Copyright © 2016 trunghoangdang. All rights reserved.
//

#import "ViewController.h"
#import "Person+CoreDataClass.h"
#import "CoreDataHelper.h"

static NSString * const kCellIdentifier = @"CellIdentifier";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;



@end

@implementation ViewController {
    NSMutableArray *arrPerson;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Core Data 1.0";
    if (!arrPerson) {
        arrPerson = [NSMutableArray new];
    }
    
    [self setupTableView];
    [self registerClassForEachCell];
    [self addRightBarButtonItem];
    
    [self fetchedAllData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Add Bar Button Items
- (void)addRightBarButtonItem {
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addElement:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

- (void)addElement:(NSManagedObject*)person {
    UIAlertController *alertTextField = [UIAlertController alertControllerWithTitle:@"Add Element" message:@"Full name" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *textField = [alertTextField.textFields firstObject];
        if (![person isKindOfClass:[NSManagedObject class]]) {
            [self saveName:textField.text andAge:@"12"];
        } else {
            [person setValue:textField.text forKey:@"name"];
            [person setValue:@"12" forKey:@"age"];
        }
        [self fetchedAllData];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    [alertTextField addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
    }];
    
    [alertTextField addAction:cancelAction];
    [alertTextField addAction:saveAction];
    
    [self presentViewController:alertTextField animated:YES completion:^{
    }];
}

- (void)saveName:(NSString *)name andAge:(NSString*)age {
    [[CoreDataHelper initCoreDataHelper] insertPersonWithName:name andAge:age];
}

#pragma mark - Fetch data from core data
- (void)fetchedAllData {
    arrPerson = [NSMutableArray arrayWithArray:[[CoreDataHelper initCoreDataHelper] selectAllPersons]];
    
    [self.tableView reloadData];
}

#pragma mark - Setup Table View
- (void)setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame
                                              style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (void)registerClassForEachCell {
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
}

#pragma mark - Table View Data Source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrPerson.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    cell = [cell initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellIdentifier];
    Person *person = [arrPerson objectAtIndex:indexPath.row];
    
    cell.textLabel.text = person.name;
    cell.detailTextLabel.text = person.age;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete object from database
        [[CoreDataHelper initCoreDataHelper] deletePerson:[arrPerson objectAtIndex:indexPath.row]];
        
        // Remove device from table view
        [arrPerson removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Table View Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSManagedObject *person = [arrPerson objectAtIndex:indexPath.row];
    [self addElement:person];
}

@end











