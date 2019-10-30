//
//  UIGestureRecognizer+Block.m
//  PassModel
//
//  Created by songlin on 2019/10/30.
//  Copyright © 2019 songlin. All rights reserved.
//

#import "UIGestureRecognizer+Block.h"
#import <objc/message.h>


static const int target_key;

@implementation UIGestureRecognizer (Block)

+ (instancetype)dt_gestureRecongnizerWithActionBlock:(DTGertureBlock)block{
    return [[self alloc]initWithActionBlock:block];
}

- (instancetype)initWithActionBlock:(DTGertureBlock)block{
    self = [self init];
    [self addActionBlock:block];
    [self addTarget:self action:@selector(invoke:)];
    return self;
}


- (void)addActionBlock:(DTGertureBlock)block{
    if (block) {
        objc_setAssociatedObject(self, &target_key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

- (void)invoke:(id)sender
{
    DTGertureBlock block = objc_getAssociatedObject(self, &target_key);
    if (block) block(sender);
}
@end
