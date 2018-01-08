![KafkaRefresh](Assets/titleView.png)

![](https://img.shields.io/packagist/l/doctrine/orm.svg)
![](https://img.shields.io/cocoapods/v/{KafkaRefresh}.svg?style=flat)
![](https://img.shields.io/badge/platform-ios-lightgrey.svg)
![](https://img.shields.io/badge/language-objc-orange.svg)

### Screenshots
<table>
<tr height="60px" align="center">
  <td width="20%"><strong>KafkaRefreshStyle</strong></td>
  <td width="40%"><strong>Top Screenshots</strong></td>
  <td width="40%"><strong>Bottom Screenshots</strong></td>
</tr>
<tr align="center" height="120px">
  <td width="300px">Native</td>
  <td><img src="Gif/native.gif"></img></td>
  <td><img src="Gif/_native.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorWoody</td>
  <td><img src="Gif/woody.gif"></img></td>
  <td><img src="Gif/_woody.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorAllen</td>
  <td><img src="Gif/allen.gif"></img></td>
  <td><img src="Gif/_allen.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorCircle</td>
  <td><img src="Gif/circle.gif"></img></td>
  <td><img src="Gif/_circle.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorDot</td>
  <td><img src="Gif/dot.gif"></img></td>
  <td><img src="Gif/_dot.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorArc</td>
  <td><img src="Gif/arc.gif"></img></td>
  <td><img src="Gif/_arc.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorTriangle</td>
  <td><img src="Gif/triangle.gif"></img></td>
  <td><img src="Gif/_triangle.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>AnimatableRing</td>
  <td><img src="Gif/ring.gif"></img></td>
  <td><img src="Gif/_ring.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>AnimatableArrow</td>
  <td><img src="Gif/arrow.gif"></img></td>
  <td><img src="Gif/_arrow.gif"></img></td>
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
  <td align="left">
   KafkaRefresh has a number of refresh styles built in, and styles can be customized,expansion interface allows developers to integrate more rich UI effects.
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>Non-refresh state automatically hidden</strong></td>
  <td align="left">
  To avoid developers manually adjust contentInset refresh the appearance of the control after the impact of the visual experience; 
  the most common situation, the absence of data, the bottom of the refresh control is not hidden, the use of KafkaRefresh to avoid the problem.
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>Anti-dithering at the end of the refresh</strong></td>
  <td align="left">When the refresh control finishes refreshing, if UIScrollView is in a scrolling state, KafkaRefresh will adjust the contntOffset that controls the UIScrollView at this time according to the refresh control</td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>Support setting the offset threshold to trigger refresh</strong></td>
  <td align="left">
   Offset threshold can be customized, manually trigger refresh conditions; offset threshold is based on the height of the refresh control multiple, and must be greater than 1.0; otherwise invalid.
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>Support global configuration</strong></td>
  <td align="left">
   KafkaRefreshDefaults supports global setting style
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>Support progress callback</strong></td>
  <td align="left">
   Real-time callback Drag the offset ratio, for the expansion of the interface, according to the progress of adjustment animation
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>Adaptive contentInset system adjustment and manual adjustment</strong></td>
  <td align="left">
  Adaptive iOS7 later UINavigationController automatically adjust scrollview contentOffset, KafkaRefresh also iOS 11 adaptation; when you manually set the value of contentInset, also need not worry about KafkaRefresh will affect the visual effects.
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>Support anti-content offset rolling refresh</strong></td>
  <td align="left">KafkaRefresh does not arbitrarily adjust the list of cntentOffset when the user scroll the list, KafkaRefresh will not over adjust the list contentOffset no matter what refresh status. Therefore, after your list is integrated with KafkaRefresh, the swipe is still the expected result</td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>Solve the refresh status grouping view hover problem</strong></td>
  <td align="left">
  When UITableView or UICollectionView has more than one group, and the height of the sectionView is not 0, the state of refresh will be half-empty. Since EGOTableViewPullRefresh, the refresh framework that tried to solve the problem started with MJRefresh, but unfortunately MJRefresh did not perfectly solve the problem (essentially because contentOffset does not change continuously). KafkaRefresh Avoids this problem even when swiping fast on a refresh.
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>Document coverage 100%</strong></td>
  <td align="left">
  You can see the use of all methods and classes in the header file.
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>Support horizontal and vertical screen switching adaptive</strong></td>
  <td align="left">
  No need to consider in the horizontal and vertical screen refresh refresh problem.
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>iOS 7+</strong></td>
  <td align="left">
  Support iOS 7 above system. Including iPhone X
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
  <td align="left">KafkaRefresh内置多种刷新样式，且可对样式进行自定义。扩展接口可让开发者集成更多丰富的UI效果。</td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>非刷新状态自动隐藏</strong></td>
  <td align="left">能避免开发者手动调整contentInset后刷新控件的出现而影响视觉体验；最常见的情况时，不存在数据时，底部的刷新的控件未隐藏，使用KafkaRefresh能避免该问题。</td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>刷新结束时滑动抗抖动</strong></td>
  <td align="left">当控件结束刷新，UIScrollView如果处于滑动状态，KafkaRefresh将根据刷新控件此时是否显示控制UIScrollView的contntOffset</td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>支持抗内容偏移的滚动刷新</strong></td>
  <td align="left">当用户滑动列表时，KafkaRefresh不会擅自调整列表的cntentOffset，KafkaRefresh不管处于何种刷新状态，都不会过多的调整列表位置。因此，您的列表集成KafkaRefresh后，滑动依旧是预期效果</td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>支持设置触发刷新的偏移阀值</strong></td>
  <td align="left">偏移阀值可自定义，自我把控触发刷新的条件；偏移阀值是基于控件高度的倍数，且必须大于1.0；否则无效。</td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>支持全局配置</strong></td>
  <td align="left">KafkaRefreshDefaults支持全局设置样式</td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>支持进度回调</strong></td>
  <td align="left">实时回调拖拽的偏移比例，对于扩展接口，可根据进度调整动画</td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>自适应contentInset系统调整与手动调整</strong></td>
  <td align="left">
  自适应iOS7以后UINavigationController自动调整scrollview contentOffset，KafkaRefresh也对iOS 11进行了适配；当您手动设置了contentInset的值，也无需担心KafkaRefresh会影响到视觉效果。
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>解决刷新状态分组视图悬停问题</strong></td>
  <td align="left">
  当UITableView优多个分组，且分组视图的高度非0时，刷新状态将出现半空悬停的效果。从EGO以来，尝试解决该问题的刷新框架始于MJRefresh，但可惜的是，MJRefresh并未完美解决该问题(本质是因为contentOffset并非连续变化)。KafkaRefresh即使在刷新状态快速滑动，也能避开该问题的出现。
  </td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>文档覆盖率100%</strong></td>
  <td align="left">可在头文件中查看所有方法和类的使用</td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>支持横竖屏切换自适应</strong></td>
  <td align="left">无需在横竖屏切换时考虑刷新问题</td> 
</tr>
<tr align="center" height="60px"> 
  <td><strong>iOS 7+</strong></td>
  <td align="left">支持iOS 7以上系统。包括iPhone X</td> 
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

### 交流
> 1. 如需要帮助，请邮件 <xorshine@icloud.com>或者wechat：Xiangxh1015；
> 2. 如遇到bug，请在Github open an issue，烦请您提供重现步骤；
> 3. 个人精力有限，Kafka提供的回调接口足够去增加更丰富的UI效果，很欢迎您一起参与，并提交pull request；
> 4. 如果您对该库有更好的设计思路，请务必e-mail或wechat。
	
### License
KafkaRefresh采用MIT开源协议。
