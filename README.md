![KafkaRefresh](Assets/titleView.png)

[![Travis](https://img.shields.io/travis/rust-lang/rust.svg)](https://github.com/xorshine/KafkaRefresh)
[![GitHub license](https://img.shields.io/github/license/xorshine/KafkaRefresh.svg)](https://github.com/xorshine/KafkaRefresh/blob/master/LICENSE)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/KafkaRefresh.svg)](https://img.shields.io/cocoapods/v/KafkaRefresh.svg)
![platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)
![language](https://img.shields.io/badge/language-objc-orange.svg) 
[![Email](https://img.shields.io/badge/e--mail-xorshine%40icloud.com-blue.svg)](mailto:xorshine@icloud.com)

 [ **中文文档** ](https://github.com/xorshine/KafkaRefresh/blob/master/CREADME.md)

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

### Overviews
Highly scalable, custom, multi-style refresh framework.

### Comparison
The following comparison does not mean that the evaluation of these open source libraries to highlight the outstanding KafkaRefresh. EGO is the earliest refresh open source library, laid the foundation for later open source library provides a good idea. MJRefresh is the first to complete a complete system adaptation. Prior to MJRefresh, refresh the library is need to make some changes to meet the daily development needs. Here to pay tribute to these excellent open source library authors.

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
 
- (void)endRefreshingWithAlertText:(NSString *)text completion:(dispatch_block_t)completion;

 
- (void)endRefreshingAndNoLongerRefreshingWithAlertText:(NSString *)text;
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