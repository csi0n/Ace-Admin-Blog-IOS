//
//  MainTabContentCellTableViewCell.m
//  Blog
//
//  Created by huaqing chen on 10/17/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "MainTabContentCellTableViewCell.h"
#import "ImageLoadHelper.h"
#import "CFFlowButtonView.h"
#import "Masonry.h"

@implementation MainTabContentCellTableViewCell
-(void)setArticle:(ArticleModel *)article{
        if (article.thumb.length>0) {
            [ImageLoadHelper loadWithImageUrl:[NSString stringWithFormat:@"http://img.csi0n.com/%@",article.thumb] imageView:[self head]];
        }
        self.title.text=article.title;
        self.content.text=article.describe;
    CFFlowButtonView *flowButtonView = [[CFFlowButtonView alloc] initWithButtonList:[self addTags:article]];
        [self.tags addSubview:flowButtonView];
        [flowButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.tags.mas_top);
            make.left.equalTo(self.tags.mas_left);
            make.right.equalTo(self.tags.mas_right);
            make.bottom.equalTo(self.tags.mas_bottom);
        }];
}
- (void)awakeFromNib {
    [super awakeFromNib];
}


-(NSMutableArray *)addTags:(ArticleModel *)article{
    NSMutableArray *arrs=[NSMutableArray array];
    for (int i=0; i<[article.tags count]; i++) {
        TagModel *tag=article.tags[i];
        UIButton *button=[[[NSBundle mainBundle] loadNibNamed:@"MyButton" owner:self options:nil] lastObject];
        [button setTitle:tag.name forState:UIControlStateNormal];
        [arrs addObject:button];
    }
    return arrs;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end
