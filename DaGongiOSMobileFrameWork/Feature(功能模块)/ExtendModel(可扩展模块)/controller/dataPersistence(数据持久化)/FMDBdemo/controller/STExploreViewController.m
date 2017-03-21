#import "STExploreViewController.h"
#import "STCommonUtil.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "STMovieWebService.h"
#import "STDBManager.h"
#import "STMovieLocalService.h"

static NSString * const STExploreCellIdentifier = @"STExploreCellIdentifier";
@interface STExploreViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *myTableView;
@property (strong, nonatomic) NSArray *movieList;
@end
@implementation STExploreViewController

#pragma mark - Property
- (UITableView *)myTableView {
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
    }
    return _myTableView;
}

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setup.
    [[STDBManager sharedInstance] setupDB];
    [self setupUI];
    
    // Load data.
    [self requestData];
    
    
}
#pragma mark - Setup
- (void)setupUI {
    // Use full screen layout.
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.extendedLayoutIncludesOpaqueBars = YES;
    
    // myTableView.
    [self.view addSubview:self.myTableView];
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    //set up image.
    UIImage *tabImage = nil;
    UIImage *tabImageHighlight = nil;
    STExploreViewController *exploreViewController = [[STExploreViewController alloc] init];
    exploreViewController.title = @"Explore";
    tabImage = [[STCommonUtil imageWithColor:[UIColor greenColor] size:CGSizeMake(30, 30)] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    tabImageHighlight = [[STCommonUtil imageWithColor:[UIColor grayColor] size:CGSizeMake(30, 30)] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    exploreViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:exploreViewController.title image:tabImage selectedImage:tabImageHighlight];
}

#pragma mark - Utility
- (void)requestData {
    // Load data from local db.
    self.movieList = [STMovieLocalService getAllMovies];
    if (self.movieList.count > 0) {
        [self.myTableView reloadData];
    }
    
    // Load new data from server and update local db data.
    NSDictionary *parameters = @{@"pageLimit" : @30, @"pageNum" : @1};
    [STMovieWebService requestMovieDataWithParameters:parameters start:^{
        [SVProgressHUD show];
    } success:^(NSDictionary *result) {
        NSArray *newMovieList = [result objectForKey:@"movieList"];
        // Update local db data.
        [STMovieLocalService removeAllMovies];
        for (STMovie *movie in newMovieList) {
            [STMovieLocalService addOrUpdateMovie:movie];
        }
        
        // Update displayed data.
        self.movieList = newMovieList;
        [self.myTableView reloadData];
        [SVProgressHUD dismiss];
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
    }];
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Movies";
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movieList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= self.movieList.count) {
        return nil;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:STExploreCellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:STExploreCellIdentifier];
    }
    
    STMovie *movie = [self.movieList objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", movie.name, movie.year];
    cell.detailTextLabel.text = movie.synopsis;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:movie.thumbnailImageURLString] placeholderImage:[STCommonUtil imageWithColor:[UIColor grayColor] size:CGSizeMake(27, 40)] completed:nil];
    cell.layer.shouldRasterize = YES;
    cell.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    return cell;
}
@end