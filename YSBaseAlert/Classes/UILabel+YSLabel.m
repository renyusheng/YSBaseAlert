//
//  UILabel+YSLabel.m
//  YSBaseAlert
//
//  Created by 任雨生 on 2019/12/26.
//

#import "UILabel+YSLabel.h"
#import "UIView+YSView.h"


@implementation UILabel (YSLabel)
/**
 固定宽度计算文字高度

 @return <#return value description#>
 */
-(CGFloat)textHeight{
    return [self textHeight:self.text font:self.font width:self.width];
}

/**
 固定高度计算文字宽度

 @return <#return value description#>
 */
-(CGFloat)textWidth{
    return [self textWidth:self.text font:self.font height:self.height];
}





/**
 计算文字高度

 @param text <#text description#>
 @param font <#font description#>
 @param width <#width description#>
 @return <#return value description#>
 */
-(CGFloat)textHeight:(NSString*)text font:(UIFont*)font width:(CGFloat)width{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    return [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:
            NSStringDrawingTruncatesLastVisibleLine |
            NSStringDrawingUsesLineFragmentOrigin |
            NSStringDrawingUsesFontLeading attributes:attribute
                              context:nil].size.height;
}


/**
 计算文字宽度

 @param text <#text description#>
 @param font <#font description#>
 @param height <#height description#>
 @return <#return value description#>
 */
-(CGFloat)textWidth:(NSString*)text font:(UIFont*)font height:(CGFloat)height{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    return [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:
            NSStringDrawingTruncatesLastVisibleLine |
            NSStringDrawingUsesLineFragmentOrigin |
            NSStringDrawingUsesFontLeading attributes:attribute
                                   context:nil].size.width;
}
@end
