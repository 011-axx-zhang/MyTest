//
//  MapViewController.m
//  test
//
//  Created by Admin on 2018/10/23.
//  Copyright © 2018年 Tima. All rights reserved.
//

#import "MapViewController.h"


#import <AMapNaviKit/AMapNaviKit.h>
#import <AMapSearchKit/AMapSearchKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

#import "MANaviRoute.h"
#import "CommonUtility.h"
#import "ConstHeader.h"


@interface MapViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource,MAMapViewDelegate,AMapSearchDelegate,AMapLocationManagerDelegate>
{
    NSString *selfCity;
    NSString *destinationId;
    NSString *destinationtype;
    CLLocationCoordinate2D starePoint2D;
    CLLocationCoordinate2D endPoint2D;
}

@property (nonatomic, strong) UITextField *starePoint;
@property (nonatomic, strong) UITextField *endPoint;
@property (nonatomic, strong) UILabel *routeTime;
//@property (nonatomic, strong) UITextField *firstResponer;       //  不参与内容赋值

@property (nonatomic, strong) UITableView *tipTable;
@property (nonatomic, strong) NSMutableArray *tipArr;


@property (nonatomic, strong) MAMapView             *mapView;
@property (nonatomic, strong) AMapLocationManager   *locationM;
@property (nonatomic, strong) AMapSearchAPI   *search;


/* 用于显示当前路线方案. */
@property (nonatomic) MANaviRoute * naviRoute;
/* 当前路线方案索引值. */
@property (nonatomic) NSInteger currentCourse;
@property (nonatomic, strong) AMapRoute *route;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"导航";
    self.view.backgroundColor = [UIColor whiteColor];
    [self mapView];
    [self.locationM startUpdatingLocation];
    
    self.search = [[AMapSearchAPI alloc] init];
    self.search.delegate = self;
    
    [self configView];
}

- (void)configView
{
    CGFloat selfWidth = self.view.frame.size.width;
    CGFloat selfHeight = self.view.frame.size.height;
    CGFloat offsetR = 100;
    self.starePoint = [[UITextField alloc]initWithFrame:CGRectMake(10, 70, selfWidth-offsetR, 40)];
    self.starePoint.placeholder = @"请输入起点位置";
    self.starePoint.delegate = self;
    self.starePoint.returnKeyType = UIReturnKeySearch;
    self.starePoint.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.starePoint];
    
    
    self.endPoint = [[UITextField alloc]initWithFrame:CGRectMake(10, 120, selfWidth-offsetR, 40)];
    self.endPoint.placeholder = @"请输入终点位置";
    self.endPoint.delegate = self;
    self.endPoint.returnKeyType = UIReturnKeySearch;
    self.endPoint.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.endPoint];
    
    
    UIButton *search = [UIButton buttonWithType:UIButtonTypeSystem];
    search.frame = CGRectMake(selfWidth - 80, 90, 60, 50);
    [search setTitle:@"搜索" forState:UIControlStateNormal];
    [search setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [search addTarget:self action:@selector(searchRoutePlanningDrive) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:search];
    
    
    self.tipTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 160, selfWidth, 200) style:UITableViewStylePlain];
    self.tipTable.delegate = self;
    self.tipTable.dataSource = self;
    self.tipTable.hidden = YES;
    self.tipTable.rowHeight = 50;
    [self.view addSubview:self.tipTable];
    
    
    self.routeTime = [[UILabel alloc]initWithFrame:CGRectMake(0, selfHeight-60, selfWidth, 60)];
    self.routeTime.backgroundColor = [UIColor whiteColor];
    self.routeTime.textAlignment = NSTextAlignmentCenter;
    self.routeTime.textColor = [UIColor blackColor];
    [self.view addSubview:self.routeTime];
}

#pragma mark - text field delegate
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.tipTable.hidden = YES;
    [self.tipArr removeAllObjects];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    [self searchForKeyword:text];
    return YES;
}
- (void)searchForKeyword:(NSString *)keyWord
{
    if (keyWord.length < 1) {
        return;
    }
    AMapInputTipsSearchRequest *tips = [[AMapInputTipsSearchRequest alloc] init];
    tips.keywords = keyWord;
    tips.city     = selfCity;
    tips.cityLimit = NO;    //是否限制城市
    
    [self.search AMapInputTipsSearch:tips];
}

#pragma mark - table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tipArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tipCellIdentifier = @"tipCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tipCellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:tipCellIdentifier];
    }
    
    AMapTip *tip = self.tipArr[indexPath.row];
    cell.textLabel.text = tip.name;
    cell.detailTextLabel.text = tip.address;
    
    return cell;
}
#pragma mark - table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    AMapTip *tip = [self.tipArr objectAtIndex:indexPath.row];
    if ([self.starePoint isFirstResponder]) {
        NSLog(@"\n 当前为起点编辑");
        starePoint2D = CLLocationCoordinate2DMake(tip.location.latitude, tip.location.longitude);
        self.starePoint.text = tip.name;
        [self.starePoint resignFirstResponder];
    }else if ([self.endPoint isFirstResponder]){
        NSLog(@"\n 当前为终点编辑");
        destinationId = tip.uid;
        destinationtype = tip.typecode;
        endPoint2D = CLLocationCoordinate2DMake(tip.location.latitude, tip.location.longitude);
        self.endPoint.text = tip.name;
        [self.endPoint resignFirstResponder];
    }
}

#pragma mark - search
- (void)AMapSearchRequest:(id)request didFailWithError:(NSError *)error
{
    NSLog(@"发生错误时调用此方法:%@",error);
}
//  驾车路线规划
- (void)searchRoutePlanningDrive
{
    if (self.starePoint.text.length < 1 || self.endPoint.text.length < 1) {
        NSLog(@"\n 起点终点文本不能为空");
        return;
    }
    if (starePoint2D.longitude < 1.0 || endPoint2D.longitude < 1.0) {
        NSLog(@"\n 起点终点坐标不能为〇");
        return;
    }
    if (destinationId.length < 1) {
        NSLog(@"\n 目的地 POI ID 为空");
    }
    if (destinationtype.length < 1) {
        NSLog(@"\n 目的地 POI 类型编码为空");
    }
    
    [self clear];
//    self.startAnnotation.coordinate = self.startCoordinate;
//    self.destinationAnnotation.coordinate = self.destinationCoordinate;
    
    AMapDrivingRouteSearchRequest *navi = [[AMapDrivingRouteSearchRequest alloc] init];
    
    navi.requireExtension = YES;
    navi.destinationId = destinationId;
    navi.destinationtype = destinationtype;
    navi.strategy = 5;
    /* 出发点. */
    navi.origin = [AMapGeoPoint locationWithLatitude:starePoint2D.latitude
                                           longitude:starePoint2D.longitude];
    /* 目的地. */
    navi.destination = [AMapGeoPoint locationWithLatitude:endPoint2D.latitude
                                                longitude:endPoint2D.longitude];
    
    [self.search AMapDrivingRouteSearch:navi];
}
/* 路径规划搜索回调. */
- (void)onRouteSearchDone:(AMapRouteSearchBaseRequest *)request response:(AMapRouteSearchResponse *)response
{
    if (response.route == nil)
    {
        return;
    }
    NSLog(@"\n 路径规划数目:%ld",response.count);
    NSLog(@"\n 路径规划信息:%@",response.route);
    
    self.route = response.route;
    self.currentCourse = 0;
    if (response.count > 0)
    {
        [self presentCurrentCourse];
        
        NSArray *arr = response.route.paths;
        NSLog(@"\n 当前路线共 %ld 条方案列表",arr.count);
        if (arr.count) {
            AMapPath *path = [arr objectAtIndex:0];
            NSInteger hour = path.duration/3600;
            NSInteger minute = path.duration%3600/60;
//            CGFloat second = path.duration%3600/60/60;
            self.routeTime.text = [NSString stringWithFormat:@"当前路线需要行驶%ld小时%ld分",(long)hour,(long)minute];
        }
    }
}

/* 展示当前路线方案. */
- (void)presentCurrentCourse
{
    MANaviAnnotationType type = MANaviAnnotationTypeDrive;
    self.naviRoute = [MANaviRoute naviRouteForPath:self.route.paths[0]
                                      withNaviType:type
                                       showTraffic:YES
                                        startPoint:[AMapGeoPoint locationWithLatitude:starePoint2D.latitude longitude:starePoint2D.longitude]
                                          endPoint:[AMapGeoPoint locationWithLatitude:endPoint2D.latitude longitude:endPoint2D.longitude]];
    [self.naviRoute addToMapView:self.mapView];
    
    
    /* 缩放地图使其适应polylines的展示. */
    [self.mapView setVisibleMapRect:[CommonUtility mapRectForOverlays:self.naviRoute.routePolylines]
                        edgePadding:UIEdgeInsetsMake(20, 20, 20, 20)
                           animated:YES];
}

/* 清空地图上已有的路线. */
- (void)clear
{
    [self.naviRoute removeFromMapView];
}


/* 输入提示回调. */
- (void)onInputTipsSearchDone:(AMapInputTipsSearchRequest *)request response:(AMapInputTipsSearchResponse *)response
{
    if (response.count == 0)
    {
        return;
    }
    
    self.tipTable.hidden = NO;
    
    [self.tipArr setArray:response.tips];
    [self.tipTable reloadData];
}
/* 公交搜索回调. */
- (void)onBusLineSearchDone:(AMapBusLineBaseSearchRequest *)request response:(AMapBusLineSearchResponse *)response
{
    if (response.buslines.count != 0)
    {
//        [self.busLines setArray:response.buslines];
//        [self presentCurrentBusLine];
    }
}
- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response
{
    NSLog(@"关键字搜索结果:%@",response);
    NSLog(@"POI 数目:%ld",response.count);
//    NSLog(@"");
}
- (void)onRoutePOISearchDone:(AMapRoutePOISearchRequest *)request response:(AMapRoutePOISearchResponse *)response
{
    NSLog(@"路径规划搜索结果:%@",response);
}

#pragma mark - location manager delegate
//  单次定位回调
- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location
{
    [self.locationM stopUpdatingLocation];
    
    
    //  将当前位置当做地图的中心点
    [self.mapView setCenterCoordinate:location.coordinate animated:YES];
    
    //构造AMapReGeocodeSearchRequest对象
    AMapReGeocodeSearchRequest *regeo = [[AMapReGeocodeSearchRequest alloc] init];
    regeo.location = [AMapGeoPoint locationWithLatitude:location.coordinate.latitude longitude:location.coordinate.longitude];
    regeo.radius = 10000;
    
    //发起逆地理编码
    [self.search AMapReGoecodeSearch:regeo];
}
- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location reGeocode:(AMapLocationReGeocode *)reGeocode
{
    NSLog(@"定位回调新接口");
}
//  逆地理编码回调
- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response
{
    if(response.regeocode != nil)
    {
        //通过AMapReGeocodeSearchResponse对象处理搜索结果
        NSString *city = response.regeocode.addressComponent.city;
        if (!city || [city length] == 0) {
            city = response.regeocode.addressComponent.province; // 直辖市时获取此字段
        }
        selfCity = city;
    }
}


#pragma mark - MAMapViewDelegate
- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id<MAOverlay>)overlay
{
    if ([overlay isKindOfClass:[LineDashPolyline class]])
    {
        NSLog(@"不知道什么线路");
        MAPolylineRenderer *polylineRenderer = [[MAPolylineRenderer alloc] initWithPolyline:((LineDashPolyline *)overlay).polyline];
        polylineRenderer.lineWidth   = 8;
        polylineRenderer.lineDashType = kMALineDashTypeSquare;
        polylineRenderer.strokeColor = [UIColor redColor];
        
        return polylineRenderer;
    }
    if ([overlay isKindOfClass:[MANaviPolyline class]])
    {
        NSLog(@"当前是导航线路显示");
        MANaviPolyline *naviPolyline = (MANaviPolyline *)overlay;
        MAPolylineRenderer *polylineRenderer = [[MAPolylineRenderer alloc] initWithPolyline:naviPolyline.polyline];
        
        polylineRenderer.lineWidth = 8;
        
        if (naviPolyline.type == MANaviAnnotationTypeWalking)
        {
            polylineRenderer.strokeColor = self.naviRoute.walkingColor;
        }
        else if (naviPolyline.type == MANaviAnnotationTypeRailway)
        {
            polylineRenderer.strokeColor = self.naviRoute.railwayColor;
        }
        else
        {
            polylineRenderer.strokeColor = self.naviRoute.routeColor;
        }
        
        return polylineRenderer;
    }
    if ([overlay isKindOfClass:[MAMultiPolyline class]])
    {
        NSLog(@"当前是分段线路的显示方式");
        MAMultiColoredPolylineRenderer * polylineRenderer = [[MAMultiColoredPolylineRenderer alloc] initWithMultiPolyline:overlay];
        
        polylineRenderer.lineWidth = 10;
        polylineRenderer.strokeColors = [self.naviRoute.multiPolylineColors copy];
        
        return polylineRenderer;
    }
    
    return nil;
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *routePlanningCellIdentifier = @"RoutePlanningCellIdentifier";
        
        MAAnnotationView *poiAnnotationView = (MAAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:routePlanningCellIdentifier];
        if (poiAnnotationView == nil)
        {
            poiAnnotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation
                                                             reuseIdentifier:routePlanningCellIdentifier];
        }
        
        poiAnnotationView.canShowCallout = YES;
        poiAnnotationView.image = nil;
        
        if ([annotation isKindOfClass:[MANaviAnnotation class]])
        {
            switch (((MANaviAnnotation*)annotation).type)
            {
                case MANaviAnnotationTypeRailway:
//                    poiAnnotationView.image = [UIImage imageNamed:@"railway_station"];
                    poiAnnotationView.annotation.title = @"station";
                    break;
                    
                case MANaviAnnotationTypeBus:
//                    poiAnnotationView.image = [UIImage imageNamed:@"bus"];
                    poiAnnotationView.annotation.title = @"bus";
                    break;
                    
                case MANaviAnnotationTypeDrive:
//                    poiAnnotationView.image = [UIImage imageNamed:@"car"];
                    poiAnnotationView.annotation.title = @"car";
                    break;
                    
                case MANaviAnnotationTypeWalking:
//                    poiAnnotationView.image = [UIImage imageNamed:@"man"];
                    poiAnnotationView.annotation.title = @"man";
                    break;
                    
                default:
                    break;
            }
        }
        else
        {
            /* 起点. */
            if ([[annotation title] isEqualToString:@"起点"])
            {
                poiAnnotationView.image = [UIImage imageNamed:@"Location_Start_Point"];
            }
            /* 终点. */
            else if([[annotation title] isEqualToString:@"终点"])
            {
                poiAnnotationView.image = [UIImage imageNamed:@"Location_End_Point"];
            }
            
        }
        
        return poiAnnotationView;
    }
    
    return nil;
}
#pragma mark - map view
- (AMapLocationManager *)locationM
{
    if (_locationM == nil) {
        
        _locationM = [[AMapLocationManager alloc] init];
        
        [_locationM setDelegate:self];
        [_locationM setLocationTimeout:6];
        [_locationM setReGeocodeTimeout:3];
        //设置期望定位精度
        [_locationM setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
    }
    return _locationM;
}
- (MAMapView *)mapView
{
    if (_mapView == nil) {
        CGFloat h = self.view.frame.size.height-164-60;
        _mapView = [[MAMapView alloc]initWithFrame:CGRectMake(0, 164, self.view.frame.size.width, h)];
        _mapView.delegate = self;
        _mapView.zoomLevel = 15;                //  缩放级别 3-20 值越小缩放越小
        _mapView.showsCompass = NO;             //  不显示指南针
        _mapView.rotateCameraEnabled = NO;      //  不许 camera 旋转
        _mapView.showsScale = NO;
        _mapView.pausesLocationUpdatesAutomatically = NO;   //后台定位
        
        [self.view addSubview:_mapView];
    }
    return _mapView;
}

#pragma mark - view method
- (NSMutableArray *)tipArr
{
    if (_tipArr == nil) {
        _tipArr = [[NSMutableArray alloc]init];
    }
    return _tipArr;
}
@end
