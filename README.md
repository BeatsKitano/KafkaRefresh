![KafkaRefresh](Assets/titleView.png)

[![GitHub license](https://img.shields.io/github/license/xorshine/KafkaRefresh.svg)](https://github.com/xorshine/KafkaRefresh/blob/master/LICENSE)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/KafkaRefresh.svg)](https://img.shields.io/cocoapods/v/KafkaRefresh.svg)
![cocoapods](https://img.shields.io/cocoapods/v/{KafkaRefresh}.svg?style=flat) 
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
  <td><img src="Assets/Gif/native.gif"></img></td>
  <td><img src="Assets/Gif/_native.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorWoody</td>
  <td><img src="Assets/Gif/woody.gif"></img></td>
  <td><img src="Assets/Gif/_woody.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorAllen</td>
  <td><img src="Assets/Gif/allen.gif"></img></td>
  <td><img src="Assets/Gif/_allen.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorCircle</td>
  <td><img src="Assets/Gif/circle.gif"></img></td>
  <td><img src="Assets/Gif/_circle.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorDot</td>
  <td><img src="Assets/Gif/dot.gif"></img></td>
  <td><img src="Assets/Gif/_dot.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorArc</td>
  <td><img src="Assets/Gif/arc.gif"></img></td>
  <td><img src="Assets/Gif/_arc.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorTriangle</td>
  <td><img src="Assets/Gif/triangle.gif"></img></td>
  <td><img src="Assets/Gif/_triangle.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>AnimatableRing</td>
  <td><img src="Assets/Gif/ring.gif"></img></td>
  <td><img src="Assets/Gif/_ring.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>AnimatableArrow</td>
  <td><img src="Assets/Gif/arrow.gif"></img></td>
  <td><img src="Assets/Gif/_arrow.gif"></img></td>
</tr>
</table>

[中文文档](#inchinese)

### Overviews
Highly scalable, custom, multi-style refresh framework.

### Comparison
<table>
<tr height="60px" align="center">
  <td width="20%"><strong></strong></td>
   
  <td width="20%">
  <a href="https://github.com/enormego/EGOTableViewPullRefresh"><strong>EGOTableViewPullRefresh</strong>
  </a>
  </td>
  
  <td width="20%"><a href="https://github.com/samvermette/SVPullToRefresh"><strong>SVPullToRefresh</strong></a></td>
  
  <td width="20%"><a href="https://github.com/CoderMJLee/MJRefresh"><strong> MJRefresh</strong></a></td>
  
   <td width="20%"><a href="##"><strong> KafkaRefresh</strong></a></td>
  
</tr>
<tr align="center" height="45px">
  <td width="20%"><strong>Style choices</strong></td>
  <td width="20%"><img width="20px" height="23px" src="Assets/unsupport.png"></img></td>
  <td width="20%"><img width="20px" height="23px" src="Assets/unsupport.png"></img></td>
  <td width="20%"><img width="20px" height="20px" src="Assets/support.png"></img></td>
  <td width="20%"><img width="20px" height="20px" src="Assets/support.png"></img></td> 
</tr>
<tr align="center" height="45px">
  <td><strong>Allow interaction when refreshing</strong></td>
  <td><img width="20px" height="20px" src="Assets/bug.png"></td>
  <td><img width="20px" height="20px" src="Assets/bug.png"></td>
  <td><img width="20px" height="23px" src="Assets/bug.png"></img></td>
  <td><img width="20px" height="20px" src="Assets/support.png"></img></td> 
</tr>
<tr align="center" height="45px">
  <td><strong>Continuous maintenance</strong></td>
  <td><img width="20px" height="23px" src="Assets/unsupport.png"></img></td>
  <td><img width="20px" height="23px" src="Assets/unsupport.png"></img></td>
  <td><img width="20px" height="20px" src="Assets/support.png"></img></td>
  <td><img width="20px" height="20px" src="Assets/support.png"></img></td>
</tr>
<tr align="center" height="45px">
  <td><strong>Progress callback</strong></td>
  <td><img width="20px" height="23px" src="Assets/unsupport.png"></img></td>
  <td><img width="20px" height="23px" src="Assets/unsupport.png"></img></td>
  <td><img width="20px" height="23px" src="Assets/unsupport.png"></img></td>
  <td><img width="20px" height="20px" src="Assets/support.png"></img></td>
</tr>
</table>

### Features
<table>
<tr height="60px"> 
  <td width="30%" align="center"><strong>Feature</strong></td>
  <td width="60%" align="center"><strong>Description</strong></td> 
</tr>
<tr align="center" height="60px">
  <td><strong>Support multi-style selection and custom</strong></td>
  <td align="left"><font color=gray size=2>
   KafkaRefresh has a number of refresh styles built in, and styles can be customized,expansion interface allows developers to integrate more rich UI effects.</font>
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>Non-refresh state automatically hidden</strong></td>
  <td align="left"><font color=gray size=2>
  To avoid developers manually adjust contentInset refresh the appearance of the control after the impact of the visual experience; 
  the most common situation, the absence of data, the bottom of the refresh control is not hidden, the use of KafkaRefresh to avoid the problem.</font>
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>Anti-dithering at the end of the refresh</strong></td>
  <td align="left"><font color=gray size=2>
  When the refresh control finishes refreshing, if UIScrollView is in a scrolling state, KafkaRefresh will adjust the contntOffset that controls the UIScrollView at this time according to the refresh control</font>
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>Support setting the offset threshold to trigger refresh</strong></td>
  <td align="left"><font color=gray size=2>
   Offset threshold can be customized, manually trigger refresh conditions; offset threshold is based on the height of the refresh control multiple, and must be greater than 1.0; otherwise invalid.</font>
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>Support global configuration</strong></td>
  <td align="left"><font color=gray size=2>
   KafkaRefreshDefaults supports global setting style</font>
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>Support progress callback</strong></td>
  <td align="left"><font color=gray size=2>
   Real-time callback Drag the offset ratio, for the expansion of the interface, according to the progress of adjustment animation.</font>
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>Adaptive contentInset system adjustment and manual adjustment</strong></td>
  <td align="left"><font color=gray size=2>
  Adaptive iOS7 later UINavigationController automatically adjust scrollview contentOffset, KafkaRefresh also iOS 11 adaptation; when you manually set the value of contentInset, also need not worry about KafkaRefresh will affect the visual effects.</font>
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>Support anti-content offset rolling refresh</strong></td>
  <td align="left"><font color=gray size=2>
  In general, we use the UITableView, especially UITableView need to use the drop-in refresh function, we rarely set SectionHeader. Unfortunately, if you use SectionHeader and integrate with UIRefreshControl or other third-party libraries, the refresh effect will be very ugly. The reason is that SectionHeader will follow the change of contentInset. The famous refresh library MJRefresh in dealing with this situation, the ScrollView manually scroll to the top, so you can solve the problem of SectionHeader dangling.<br/>
   However, if your UITableView uses preprocessing or preloading techniques, then this is obviously not enough. When KafkaRefresh processes the situation, it determines according to the current position of the refresh control. If the user pull-down distance exceeds the height of the refresh control and the refresh control still can not be displayed on the screen, then only the refresh logic needs to be processed at this time, Without any refresh effect (without changing contentInset and contentOffset), even if the user suddenly slipping the top of the page, it will dynamically change the contentInset value, the user can still see the refresh effect, so deal with the data preloading Technical performance is very friendly.</font>
</td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>Solve the refresh status grouping view hover problem</strong></td>
  <td align="left"><font color=gray size=2>
  When UITableView or UICollectionView has more than one group, and the height of the sectionView is not 0, the state of refresh will be half-empty. Since EGOTableViewPullRefresh, the refresh framework that tried to solve the problem started with MJRefresh, but unfortunately MJRefresh did not perfectly solve the problem (essentially because contentOffset does not change continuously). KafkaRefresh Avoids this problem even when swiping fast on a refresh.</font>
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>Document coverage 100%</strong></td>
  <td align="left"><font color=gray size=2>
  You can see the use of all methods and classes in the header file.</font>
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>Support horizontal and vertical screen switching adaptive</strong></td>
  <td align="left"><font color=gray size=2>
  No need to consider in the horizontal and vertical screen refresh refresh problem.
  </font>
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>iOS 7+</strong></td>
  <td align="left"><font color=gray size=2>
  Support iOS 7 above system. Including iPhone X</font>
  </td> 
</tr>
</table>

### Installation 
* CocoaPods
```ruby
pod 'KafkaRefresh'
```

* Carthage 

If anyone wants to install by *carthage* , please supply a pull request. I'm not using this package manager myself.

### Usage

##### 1.Import header files
```objective-c
 #import "KafkaRefresh.h" 
```

##### 2.Initialization
* The first way
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

* The second way
```objective-c
 KafkaArrowHeader * arrow = [[KafkaArrowHeader alloc] init];
 arrow.refreshHandler = ^{
	 //.....
 };
 self.tableView.headRefreshControl = arrow;
```

* The third way(global configuration)

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	[[KafkaRefreshDefaults standardRefreshDefaults] setHeaderDefaultStyle:KafkaRefreshStyleAnimatableRing];
	return YES;
}

[self.tableView bindDefaultRefreshStyleAtPosition:KafkaRefreshPositionHeader refreshHanler:^{
		//.....
}];

```

##### 3.Manual trigger refresh
```objective-c
 [self.tableView.headRefreshControl beginRefreshing];

 [self.tableView.footRefreshControl beginRefreshing];
```

##### 4.End refresh
```objective-c
 [self.tableView.headRefreshControl endRefreshing];
 
 [self.tableView.footRefreshControl endRefreshing];
```

### Customize
Take KafkaheadRefreshControl as an example
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
	//Initialization properties
}
 
- (void)kafkaDidScrollWithProgress:(CGFloat)progress max:(const CGFloat)max{
	//progress callback
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

### Precautions
* Please update the latest version；
* After iOS 11, if you use estimatedRowHeight and the estimatedRowHeight height is too far from the true height, UITableView repeated refreshes may occur before version 0.8.3, which has been resolved since version 0.8.3 (iOS bug)


### Communication
> 1. If you need help，please email <xorshine@icloud.com>.
> 2. If you found a bug，and can provide steps to reliably reproduce it, open an issue.
> 3. Personal energy is limited, Kafka provides callback interface enough to increase the richer UI effect, we welcome you to join together and submit the pull request.  


### License
KafkaRefresh is released under the MIT license. See LICENSE for details.


### <a id="inchinese"></a>概述
高度可扩展、自定义、多样式的刷新框架。

### 比较
<table>
<tr height="45px" align="center">
  <td width="20%"><strong></strong></td>
   
  <td width="20%"><a href="https://github.com/enormego/EGOTableViewPullRefresh"><strong>EGOTableViewPullRefresh</strong></a></td>
  
  <td width="20%"><a href="https://github.com/samvermette/SVPullToRefresh"><strong>SVPullToRefresh</strong></a></td>
  
  <td width="20%"><a href="https://github.com/CoderMJLee/MJRefresh"><strong> MJRefresh</strong></a></td>
  
   <td width="20%"><a href="##"><strong> KafkaRefresh</strong></a></td>
  
</tr>
<tr align="center" height="45px">
  <td width="20%"><strong>多种样式选择</strong></td>
  <td width="20%"><img width="20px" height="23px" src="Assets/unsupport.png"></img></td>
  <td width="20%"><img width="20px" height="23px" src="Assets/unsupport.png"></img></td>
  <td width="20%"><img width="20px" height="20px" src="Assets/support.png"></img></td>
  <td width="20%"><img width="20px" height="20px" src="Assets/support.png"></img></td> 
</tr>
<tr align="center" height="45px">
  <td><strong>刷新中允许交互</strong></td>
  <td><img width="20px" height="20px" src="Assets/bug.png"></td>
  <td><img width="20px" height="20px" src="Assets/bug.png"></td>
  <td><img width="20px" height="23px" src="Assets/bug.png"></img></td>
  <td><img width="20px" height="20px" src="Assets/support.png"></img></td> 
</tr>
<tr align="center" height="45px">
  <td><strong>持续维护</strong></td>
  <td><img width="20px" height="23px" src="Assets/unsupport.png"></img></td>
  <td><img width="20px" height="23px" src="Assets/unsupport.png"></img></td>
  <td><img width="20px" height="20px" src="Assets/support.png"></img></td>
  <td><img width="20px" height="20px" src="Assets/support.png"></img></td>
</tr>
<tr align="center" height="45px">
  <td><strong>进度回调</strong></td>
  <td><img width="20px" height="23px" src="Assets/unsupport.png"></img></td>
  <td><img width="20px" height="23px" src="Assets/unsupport.png"></img></td>
  <td><img width="20px" height="23px" src="Assets/unsupport.png"></img></td>
  <td><img width="20px" height="20px" src="Assets/support.png"></img></td>
</tr>
</table>

### 特点
<table>
<tr align="center" height="60px"> 
  <td width="30%"><strong>特点</strong></td>
  <td width="70%"><strong>描述</strong></td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>支持多样式选择与自定义</strong></td>
  <td align="left"><font color=gray size=2>
  KafkaRefresh内置多种刷新样式，且可对样式进行自定义。扩展接口可让开发者集成更多丰富的UI效果。
  </font></td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>非刷新状态自动隐藏</strong></td>
  <td align="left">
  <font color=gray size=2>
  能避免开发者手动调整contentInset后刷新控件的出现而影响视觉体验；最常见的情况时，不存在数据时，底部的刷新的控件未隐藏，使用KafkaRefresh能避免该问题。</font>
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>刷新结束时滑动抗抖动</strong></td>
  <td align="left">
  <font color=gray size=2>
  当控件结束刷新，UIScrollView如果处于滑动状态，KafkaRefresh将根据刷新控件此时是否显示控制UIScrollView的contntOffset.</font>
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>支持抗内容偏移的滚动刷新</strong></td>
  <td align="left"><font color=gray size=2>
一般的，我们在使用UITableView，特别是UITableView需要用到下拉刷新功能时，我们很少设置SectionHeader。不幸的是，如果使用了SectionHeader，且集成了UIRefreshControl或者其他第三方库，那么刷新的效果将会很难看。原因是SectionHeader将会跟随contentInset的变化而变化。著名的刷新库MJRefresh在处理这个情况时，将ScrollView手动滚动到最顶部，这样可以解决SectionHeader悬空的问题。但如果你的UITableView使用了预处理或者预加载技术，那么这样的处理显然不够。KafkaRefresh处理该情况时，根据刷新控件当前的位置进行判断，如果用户下拉的距离超过刷新控件的高度，且此时刷新控件依旧不能出现在屏幕上时，则认为此时只需要处理刷新逻辑，而无需出现任何的刷新效果（不改变contentInset和contentOffset），即使在刷新中，如果用户突然滑倒最顶端，将会动态改变contentInset的数值，用户依然能看到刷新效果，这样处理在数据的预加载技术中表现很友好。</font></td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>支持设置触发刷新的偏移阀值</strong></td>
  <td align="left">
  <font color=gray size=2>
  偏移阀值可自定义，自我把控触发刷新的条件；偏移阀值是基于控件高度的倍数，且必须大于1.0；否则无效。
  </font></td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>支持全局配置</strong></td>
  <td align="left"><font color=gray size=2>KafkaRefreshDefaults支持全局设置样式</font></td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>支持进度回调</strong></td>
  <td align="left"><font color=gray size=2>实时回调拖拽的偏移比例，对于扩展接口，可根据进度调整动画</font></td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>自适应contentInset系统调整与手动调整</strong></td>
  <td align="left"><font color=gray size=2>
  自适应iOS7以后UINavigationController自动调整scrollview contentOffset，KafkaRefresh也对iOS 11进行了适配；当您手动设置了contentInset的值，也无需担心KafkaRefresh会影响到视觉效果。</font>
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>解决刷新状态分组视图悬停问题</strong></td>
  <td align="left"><font color=gray size=2>
  当UITableView优多个分组，且分组视图的高度非0时，刷新状态将出现半空悬停的效果。从EGO以来，尝试解决该问题的刷新框架始于MJRefresh，但可惜的是，MJRefresh并未完美解决该问题(本质是因为contentOffset并非连续变化)。KafkaRefresh即使在刷新状态快速滑动，也能避开该问题的出现。</font>
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>文档覆盖率100%</strong></td>
  <td align="left"><font color=gray size=2>可在头文件中查看所有方法和类的使用</font></td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>支持横竖屏切换自适应</strong></td>
  <td align="left"><font color=gray size=2>无需在横竖屏切换时考虑刷新问题</font></td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>iOS 7+</strong></td>
  <td align="left"><font color=gray size=2>支持iOS 7以上系统。包括iPhone X</font></td> 
</tr>
</table>
 
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
 [self.tableView.headRefreshControl endRefreshing];

 [self.tableView.footRefreshControl endRefreshing];
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
> 1. 如需要帮助，请邮件 <xorshine@icloud.com>或者wechat：Xiangxh1015；
> 2. 个人精力有限，Kafka提供的回调接口足够去增加更丰富的UI效果，很欢迎您一起参与，并提交pull request；
> 3. 如果您对该库有更好的设计思路，请务必e-mail或wechat。
	
### License
KafkaRefresh采用MIT开源协议。
