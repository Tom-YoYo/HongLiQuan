//
//  YBNavMenuView.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBNavMenuView.h"

@interface YBNavMenuView ()

@property (nonatomic, strong) UIView *bottomLine;
@property (nonatomic, strong) UIButton *selectBtn;


@end

@implementation YBNavMenuView

- (void)setSelectBtn:(UIButton *)selectBtn
{
    _selectBtn.selected = NO;
    _selectBtn = selectBtn;
    selectBtn.selected = YES;
}

- (UIView *)bottomLine
{
    if (_bottomLine==nil) {
        _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.height-2, self.width/self.items.count, 2)];
        _bottomLine.backgroundColor = kNavColor;
        [self addSubview:_bottomLine];
    }
    return _bottomLine;
}

- (void)setItems:(NSArray<NSString *> *)items
{
    _items = items;
    CGFloat w = self.width/items.count;
    [items enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.titleLabel.numberOfLines = 0;
        btn.frame = CGRectMake(w*idx, 0, w, self.height);
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [btn setTitleColor:kNavColor forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitle:obj forState:UIControlStateNormal];
        btn.tag = 10+idx;
        YBWeakSelf
        [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
            if (weakSelf.selectBtn == x) return;
            weakSelf.selectIndex = idx;
            
            if (weakSelf.didClicked) {
                weakSelf.didClicked(idx);
            }
        }];
        [self addSubview:btn];
    }];
    self.selectIndex = 0;
}

- (void)setSelectIndex:(NSInteger)selectIndex
{
    _selectIndex = selectIndex;
    self.bottomLine.x = selectIndex*self.bottomLine.width;
    self.selectBtn = [self viewWithTag:10+selectIndex];
}

- (instancetype)initWithFrame:(CGRect)frame items:(NSArray<NSString *> *)items didClicked:(void (^)(NSInteger))didClicked
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupGrayLine];
        self.didClicked = didClicked;
        self.items = items;
    }
    return self;
}

- (void)setupGrayLine
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, self.height-1, self.width, 1)];
    view.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:view];
}

@end
