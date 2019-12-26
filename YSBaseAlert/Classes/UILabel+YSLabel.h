//
//  UILabel+YSLabel.h
//  YSBaseAlert
//
//  Created by 任雨生 on 2019/12/26.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (YSLabel)
/**
 固定宽度计算文字高度
 
 @return <#return value description#>
 */
-(CGFloat)textHeight;

/**
 固定高度计算文字宽度
 
 @return return value description
 */
-(CGFloat)textWidth;
@end

NS_ASSUME_NONNULL_END
