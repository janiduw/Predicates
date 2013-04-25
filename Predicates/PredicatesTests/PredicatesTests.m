//
//  PredicatesTests.m
//  PredicatesTests
//
//  Created by Lion User on 25/04/2013.
//  Copyright (c) 2013 Jani. All rights reserved.
//

#import "PredicatesTests.h"
#import "Book.h"
@implementation PredicatesTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    self.books = [NSMutableArray new];
    
    @autoreleasepool {
        for (int i = 0; i < 10; i++) {
            Book *book = [Book new];
            book.name = [NSString stringWithFormat:@"Name %i" , i];
            book.age = i;
            [self.books addObject:book];
        }
    }
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    NSArray *filtered = [self.books filteredArrayUsingPredicate:
                         [NSPredicate predicateWithFormat:@"(age == %i)", 2]];
    
    STAssertTrue(filtered.count == 1, @"Array Count should be 1");
    
    Book *book = [filtered objectAtIndex:0];
    STAssertTrue([book.name isEqualToString:@"Name 2"], @"Name should be 1");
}

@end
