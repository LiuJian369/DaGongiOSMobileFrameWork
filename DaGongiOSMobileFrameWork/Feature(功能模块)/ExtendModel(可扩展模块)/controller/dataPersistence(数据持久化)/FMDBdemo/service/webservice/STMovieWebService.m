#import "STMovieWebService.h"
#import <AFNetworking/AFNetworking.h>
static NSString * const STRequestMovieDataURL = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=7waqfqbprs7pajbz28mqf6vz&page_limit=%@&page=%@";
@implementation STMovieWebService

#pragma mark - Movie Data WebService
+ (void)requestMovieDataWithParameters:(id)parameters start:(void (^)(void))start success:(void (^)(NSDictionary *result))success failure:(void (^)(NSError *error))failure {
    // Start.
    start();
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSString *pageLimit = [NSString stringWithFormat:@"%d", (int32_t) [parameters[@"pageLimit"] intValue]];
    NSString *pageNum = [NSString stringWithFormat:@"%d", (int32_t) [parameters[@"pageNum"] intValue]];
    NSString *URLString = [NSString stringWithFormat:STRequestMovieDataURL, pageLimit, pageNum];
    NSURL *URL = [NSURL URLWithString:URLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            //NSLog(@"Error: %@", error);
            failure(error);
        } else {
            //NSLog(@"%@ %@", response, responseObject);
            NSArray *movieList = [STMovieWebService parseMovieListFromData:responseObject];
            NSDictionary *result = @{@"movieList" : movieList};
            success(result);
        }
    }];
    [dataTask resume];
}
#pragma mark - Utility
+ (NSArray *)parseMovieListFromData:(NSDictionary *)data {
    if (!data) {
        return nil;
    }
    
    NSMutableArray *movieList = [[NSMutableArray alloc] init];
    
    NSArray *movieDataList = [data objectForKey:@"movies"];
    for (int32_t i = 0; i < movieDataList.count; i++) {
        STMovie *movie = [[STMovie alloc] init];
        NSDictionary *movieData = movieDataList[i];
        movie.rowid = [[movieData objectForKey:@"id"] longLongValue];
        movie.name = [movieData objectForKey:@"title"];
        movie.year = [movieData objectForKey:@"year"];
        movie.synopsis = [movieData objectForKey:@"synopsis"];
        NSDictionary *postersData = [movieData objectForKey:@"posters"];
        if (postersData) {
            movie.thumbnailImageURLString = [postersData objectForKey:@"thumbnail"];
        } else {
            movie.thumbnailImageURLString = nil;
        }
        
        [movieList addObject:movie];
    }
    
    return [movieList copy];
}
@end