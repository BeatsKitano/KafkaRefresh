<p align="center">
  <a href=#>
    <img src="https://github.com/xorshine/KafkaRefresh/blob/master/assets/titleView.png" alt="" width=60 height=60>
  </a>

  <h3 align="center">KafkaRefresh</h3> 
  <p align="center">
     内置多种动画、可自定义和灵活的iOS下拉刷新框架。
    <br> 
    <br>
    <a href="https://github.com/xorshine/KafkaRefresh/issues/new?template=bug_cn.md">Bug提交</a>
    ·
    <a href="https://github.com/xorshine/KafkaRefresh/issues/new?">需求提交</a>  
  </p>
</p> 
<br>
 
### Status

[![GitHub license](https://img.shields.io/github/license/xorshine/KafkaRefresh.svg)](https://github.com/xorshine/KafkaRefresh/blob/master/LICENSE)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/KafkaRefresh.svg)](https://img.shields.io/cocoapods/v/KafkaRefresh.svg)
![platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)
![language](https://img.shields.io/badge/language-objc-orange.svg) 
[![Email](https://img.shields.io/badge/e--mail-xorshine%40icloud.com-blue.svg)](mailto:xorshine@icloud.com)

### Screenshots
<table>
<tr height="60px" align="center">
  <td width="20%"><strong>KafkaRefreshStyle</strong></td>
  <td width="40%"><strong>Top Screenshots</strong></td>
  <td width="40%"><strong>Bottom Screenshots</strong></td>
</tr>
<tr align="center" height="120px">
  <td width="300px">Native</td>
  <td><img src="assets/Gif/native.gif"></img></td>
  <td><img src="assets/Gif/_native.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorWoody</td>
  <td><img src="assets/Gif/woody.gif"></img></td>
  <td><img src="assets/Gif/_woody.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorAllen</td>
  <td><img src="assets/Gif/allen.gif"></img></td>
  <td><img src="assets/Gif/_allen.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorCircle</td>
  <td><img src="assets/Gif/circle.gif"></img></td>
  <td><img src="assets/Gif/_circle.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorDot</td>
  <td><img src="assets/Gif/dot.gif"></img></td>
  <td><img src="assets/Gif/_dot.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorArc</td>
  <td><img src="assets/Gif/arc.gif"></img></td>
  <td><img src="assets/Gif/_arc.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorTriangle</td>
  <td><img src="assets/Gif/triangle.gif"></img></td>
  <td><img src="assets/Gif/_triangle.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>AnimatableRing</td>
  <td><img src="assets/Gif/ring.gif"></img></td>
  <td><img src="assets/Gif/_ring.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>AnimatableArrow</td>
  <td><img src="assets/Gif/arrow.gif"></img></td>
  <td><img src="assets/Gif/_arrow.gif"></img></td>
</tr>
</table>

### <a id="inchinese"></a>概述
> 高度可扩展、自定义、多样式的刷新框架。

### 特点
* 支持多样式选择与自定义

> 内置9种动画样式

* 非刷新状态自动隐藏

> 能避免开发者手动调整contentInset后刷新控件的出现而影响视觉体验；最常见的情况时，不存在数据时，底部的刷新的控件未隐藏，使用KafkaRefresh能避免该问题。

* 刷新结束时滑动抗抖动

> 当控件结束刷新，UIScrollView如果处于滑动状态，KafkaRefresh将根据刷新控件此时是否显示控制UIScrollView的contntOffset.
 
* 支持调整触发刷新的偏移阀值

> 偏移阀值可自定义，自我把控触发刷新的条件；偏移阀值是基于控件高度的倍数，且须大于1.0。
 
* 支持全局配置

> `KafkaRefreshDefaults`支持全局设置样式,更少的代码。

* 支持进度回调

> 实时回调拖拽的偏移比例，对于扩展接口，可根据进度调整动画.

* 自适应contentInset系统调整与手动调整

> 自适应iOS7以后UINavigationController自动调整scrollview contentOffset，KafkaRefresh也对iOS 11进行了适配；当您手动设置了contentInset的值，也无需担心KafkaRefresh会影响到视觉效果。

* 解决刷新状态分组视图悬停问题

> 即使在列表高速滑动置顶时，视图都将跟随ScrollView滑动。

* 文档覆盖率100%、支持横竖屏切换自适应、iOS 7+。

 
### 安装
* CocoaPods
```ruby
pod 'KafkaRefresh'
```

* Carthage 

如果您想通过*carthage*安装 , 请您申请一个pull request.

### 使用

##### 1.引入头文件
```objective-c
 #import "KafkaRefresh.h" 
```

##### 2.初始化控件
* 方式一
```objective-c
 [self.tableView bindRefreshStyle:KafkaRefreshStyleAnimatableArrow
						   fillColor:MainColor
						  atPosition:KafkaRefreshPositionHeader refreshHanler:^{
		 //.......
	}];

 [self.tableView bindRefreshStyle:KafkaRefreshStyleAnimatableArrow
						   fillColor:MinorColor
						  atPosition:KafkaRefreshPositionFooter
					   refreshHanler:^{
		 //.....
	}];
```
* 方式二
```objective-c
 KafkaArrowHeader * arrow = [[KafkaArrowHeader alloc] init];
 arrow.refreshHandler = ^{
	 //.....
 };
 self.tableView.headRefreshControl = arrow;
```

* 方式三 全局配置
```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	[[KafkaRefreshDefaults standardRefreshDefaults] setHeaderDefaultStyle:KafkaRefreshStyleAnimatableRing];
	return YES;
}

[self.tableView bindDefaultRefreshStyleAtPosition:KafkaRefreshPositionHeader refreshHanler:^{
		//.....
}];

```
##### 3.手动触发刷新
```objective-c
 [self.tableView.headRefreshControl beginRefreshing];
 [self.tableView.footRefreshControl beginRefreshing];
```

##### 4.结束刷新
```objective-c

/*
	一般方式结束刷新
*/
- (void)endRefreshing;
 
/*
	结束刷新且需要提示文字
*/
- (void)endRefreshingWithAlertText:(NSString *)text completion:(dispatch_block_t)completion;

/*
	结束刷新且不再需要刷新功能
*/
- (void)endRefreshingAndNoLongerRefreshingWithAlertText:(NSString *)text;
```

### 自定义
以KafkaheadRefreshControl为例：
```objective-c
 #import "KafkaheadRefreshControl.h"
 @interface CustomHeader : KafkafootRefreshControl
 @end
 ```
 ***
 .m
 
 ```objective-c
 @implementation CustomHeader 
 
 - (void)setupProperties{
	[super setupProperties];
	//初始化属性
}
 
- (void)kafkaDidScrollWithProgress:(CGFloat)progress max:(const CGFloat)max{
	//进度回调
}

- (void)kafkaRefreshStateDidChange:(KafkaRefreshState)state{
	[super kafkaRefreshStateDidChange:state];
	
	switch (state) {
		case KafkaRefreshStateNone:{
			break;
		}
		case KafkaRefreshStateScrolling:{
			break;
		}
		case KafkaRefreshStateReady:{
			break;
		}
		case KafkaRefreshStateRefreshing:{ 
			break;
		}
		case KafkaRefreshStateWillEndRefresh:{ 
			break;
		}
	}
}
 @end
```

### 注意事项
* 请更新至最新版本
* iOS11之后，如果你使用了estimatedRowHeight，estimatedRowHeight的高度与真实高度相差过大，0.8.3版本之前可能会出现UITableView重复刷新问题，0.8.3版本后该问题已经解决(iOS bug)

### 交流
> 1. 如需要帮助，请邮件 <xorshine@icloud.com> 
> 2. 个人精力有限，KafkaRefresh开放的接口足够去扩展更丰富的UI效果，欢迎您参与，并提交pull request
	
### 协议
> KafkaRefresh采用MIT开源协议。
