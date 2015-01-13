//
//  Scribble.m
//  Touch&PatternDemo
//
//  Created by Andrew on 15/1/13.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import "Scribble.h"
#import "Scribble.h"
#import "Stroke.h"

@interface Scribble()
@property (nonatomic, retain) id <Mark> mark;

@end

@implementation Scribble
@synthesize mark=parentMark_;
-(id)init{
    self=[super init];
    if(self){
        parentMark_=[[Stroke alloc]init];
        
    }
    return self;
}

#pragma mark -
#pragma mark Methods for Mark management
-(void)addMark:(id<Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark{
 //手动管理KVO
    [self willChangeValueForKey:@"mark"];
    if(shouldAddToPreviousMark){
        [[parentMark_ lastChild]addMark:aMark];
    }
    else{
        [parentMark_ addMark:aMark];
        incrementalMark_ = aMark;
    }
    [self didChangeValueForKey:@"mark"];
}

-(void)removeMark:(id<Mark>)aMark{
   if(aMark==parentMark_)
       return;
    // manual KVO invocation
    [self willChangeValueForKey:@"mark"];
    
    [parentMark_ removeMark:aMark];
    // we don't need to keep the
    // incrementalMark_ reference
    // as it's just removed in the parent
    if (aMark == incrementalMark_)
    {
        incrementalMark_ = nil;
    }
    
    // manual KVO invocation
    [self didChangeValueForKey:@"mark"];
    
}


@end







