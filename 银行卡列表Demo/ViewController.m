/**
 *            .,,       .,:;;iiiiiiiii;;:,,.     .,,
 *          rGB##HS,.;iirrrrriiiiiiiiiirrrrri;,s&##MAS,
 *         r5s;:r3AH5iiiii;;;;;;;;;;;;;;;;iiirXHGSsiih1,
 *            .;i;;s91;;;;;;::::::::::::;;;;iS5;;;ii:
 *          :rsriii;;r::::::::::::::::::::::;;,;;iiirsi,
 *       .,iri;;::::;;;;;;::,,,,,,,,,,,,,..,,;;;;;;;;iiri,,.
 *    ,9BM&,            .,:;;:,,,,,,,,,,,hXA8:            ..,,,.
 *   ,;&@@#r:;;;;;::::,,.   ,r,,,,,,,,,,iA@@@s,,:::;;;::,,.   .;.
 *    :ih1iii;;;;;::::;;;;;;;:,,,,,,,,,,;i55r;;;;;;;;;iiirrrr,..
 *   .ir;;iiiiiiiiii;;;;::::::,,,,,,,:::::,,:;;;iiiiiiiiiiiiri
 *   iriiiiiiiiiiiiiiii;;;::::::::::::::::;;;iiiiiiiiiiiiiiiir;
 *  ,riii;;;;;;;;;;;;;:::::::::::::::::::::::;;;;;;;;;;;;;;iiir.
 *  iri;;;::::,,,,,,,,,,:::::::::::::::::::::::::,::,,::::;;iir:
 * .rii;;::::,,,,,,,,,,,,:::::::::::::::::,,,,,,,,,,,,,::::;;iri
 * ,rii;;;::,,,,,,,,,,,,,:::::::::::,:::::,,,,,,,,,,,,,:::;;;iir.
 * ,rii;;i::,,,,,,,,,,,,,:::::::::::::::::,,,,,,,,,,,,,,::i;;iir.
 * ,rii;;r::,,,,,,,,,,,,,:,:::::,:,:::::::,,,,,,,,,,,,,::;r;;iir.
 * .rii;;rr,:,,,,,,,,,,,,,,:::::::::::::::,,,,,,,,,,,,,:,si;;iri
 *  ;rii;:1i,,,,,,,,,,,,,,,,,,:::::::::,,,,,,,,,,,,,,,:,ss:;iir:
 *  .rii;;;5r,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,sh:;;iri
 *   ;rii;:;51,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.:hh:;;iir,
 *    irii;::hSr,.,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.,sSs:;;iir:
 *     irii;;:iSSs:.,,,,,,,,,,,,,,,,,,,,,,,,,,,..:135;:;;iir:
 *      ;rii;;:,r535r:...,,,,,,,,,,,,,,,,,,..,;sS35i,;;iirr:
 *       :rrii;;:,;1S3Shs;:,............,:is533Ss:,;;;iiri,
 *        .;rrii;;;:,;rhS393S55hh11hh5S3393Shr:,:;;;iirr:
 *          .;rriii;;;::,:;is1h555555h1si;:,::;;;iirri:.
 *            .:irrrii;;;;;:::,,,,,,,,:::;;;;iiirrr;,
 *               .:irrrriiiiii;;;;;;;;iiiiiirrrr;,.
 *                  .,:;iirrrrrrrrrrrrrrrrri;:.
 *                        ..,:::;;;;:::,,.
 */

//  ViewController.m
//  银行卡列表Demo
//
//  Created by ZSMAC on 2017/10/26.
//  Copyright © 2017年 张帅. All rights reserved.
//


#import "ViewController.h"
#import "BankCardcCell.h"
#define SCREEN [UIScreen mainScreen].bounds.size
@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegate>{
    ///开始滑动时的 Y 值
    CGFloat _startSlidingY;
    ///向上滑动
    BOOL _upSliding;
    ///第一次运行
    BOOL _firstRun;
    NSArray * _bankNameArray;
}

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:38/255.0f green:44/255.0f blue:50/255.0f alpha:1];
    [self initData];
    [self uiConfigure];
}
- (void)initData {
    _firstRun=YES;
    _upSliding=YES;
    _bankNameArray=@[@"中国银行",@"建设银行",@"中信银行",@"中国农业银行",@"浦发银行",@"中国邮政银行",@"交通银行",@"招商银行",];
}
- (void)uiConfigure {
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN.width, 64)];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.text=@"我的银行卡";
    titleLabel.font=[UIFont systemFontOfSize:18];
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.backgroundColor=[UIColor clearColor];
    [self.view addSubview:titleLabel];
    
    UICollectionViewFlowLayout *flatout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat width = SCREEN.width-30;
    flatout.itemSize = CGSizeMake(width, 130);
    //负值 折叠效果
    flatout.minimumLineSpacing = -20;
    
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,64, SCREEN.width, SCREEN.height-64) collectionViewLayout:flatout];
    collectionView.dataSource=self;
    collectionView.delegate=self;
    /*tableView的数据无论多少，它的界面默认都是可以滑动的。
     和tableView相比，当collectionView的数据较少不够一个屏幕时，它无法滑动。
     解决方案：设置为总能垂直滑动就OK了。 alwaysBounceVertical =YES */
    collectionView.alwaysBounceVertical = YES;
    collectionView.backgroundColor=[UIColor colorWithRed:38/255.0f green:44/255.0f blue:50/255.0f alpha:1];
    [self.view addSubview:collectionView];
    [collectionView registerClass:[BankCardcCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
}
/**
 * 頂頂頂頂頂頂頂頂頂　頂頂頂頂頂頂頂頂頂
 * 頂頂頂頂頂頂頂　　　　　頂頂
 * 　　　頂頂　　　頂頂頂頂頂頂頂頂頂頂頂
 * 　　　頂頂　　　頂頂頂頂頂頂頂頂頂頂頂
 * 　　　頂頂　　　頂頂　　　　　　　頂頂
 * 　　　頂頂　　　頂頂　　頂頂頂　　頂頂
 * 　　　頂頂　　　頂頂　　頂頂頂　　頂頂
 * 　　　頂頂　　　頂頂　　頂頂頂　　頂頂
 * 　　　頂頂　　　頂頂　　頂頂頂　　頂頂
 * 　　　頂頂　　　　　　　頂頂頂
 * 　　　頂頂　　　　　　頂頂　頂頂　頂頂
 * 　頂頂頂頂　　　頂頂頂頂頂　頂頂頂頂頂
 * 　頂頂頂頂　　　頂頂頂頂　　　頂頂頂頂
 */
#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _bankNameArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BankCardcCell * cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    cell.backgroundColor= [UIColor colorWithRed: arc4random_uniform(256)/255.0f green: arc4random_uniform(256)/255.0f blue: arc4random_uniform(256)/255.0f alpha:1];
    cell.userName=@"高富帅";
    cell.bankName=_bankNameArray[indexPath.row];
    cell.account=@"****  ****  ****  8888";
    return cell;
}

#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_firstRun) {
        /*第一次运行显示界面时 所有显示的cell都放到最高层 后出现的就会压住前面的*/
        //上
        [collectionView bringSubviewToFront:cell];
    } else {
        
        if (_upSliding) {
              /* 向上滑时 后出现的就会压住前面的*/
            //上滑
            [collectionView bringSubviewToFront:cell];
        } else {
             /* 向下滑时 把每个将要出现的放到最底部 后出现的就会在前一个cell的下面*/
            //下滑
            [collectionView sendSubviewToBack:cell];
        }
    }
}
#pragma mark UIScrollViewDelegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _startSlidingY = scrollView.contentOffset.y;
    _firstRun=NO;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y<_startSlidingY) {
        //下
        _upSliding=NO;
    } else  {
        //上
        _upSliding=YES;
    }
     _startSlidingY = scrollView.contentOffset.y;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
