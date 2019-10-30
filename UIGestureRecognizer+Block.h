//
//  UIGestureRecognizer+Block.h
//  PassModel
//
//  Created by songlin on 2019/10/30.
//  Copyright © 2019 songlin. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^DTGertureBlock)(id _Nullable gesture);
NS_ASSUME_NONNULL_BEGIN

@interface UIGestureRecognizer (Block)

+ (instancetype)dt_gestureRecongnizerWithActionBlock:(DTGertureBlock)block;
- (instancetype)initWithActionBlock:(DTGertureBlock)block;
@end

NS_ASSUME_NONNULL_END
