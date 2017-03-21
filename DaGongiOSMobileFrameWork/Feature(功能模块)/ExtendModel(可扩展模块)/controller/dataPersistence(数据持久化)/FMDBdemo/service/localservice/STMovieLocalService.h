#import <Foundation/Foundation.h>
#import "STMovie.h"



@interface STMovieLocalService : NSObject
#pragma mark - STMovieLocalService
+ (NSArray *)getAllMovies;
+ (int64_t)addOrUpdateMovie:(STMovie *)movie;
+ (BOOL)removeAllMovies;
@end