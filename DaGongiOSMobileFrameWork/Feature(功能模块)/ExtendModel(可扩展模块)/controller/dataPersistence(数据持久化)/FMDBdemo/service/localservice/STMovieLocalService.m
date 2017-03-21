
#import "STMovieLocalService.h"
#import <FMDB/FMDB.h>
#import "STDBManager.h"
@implementation STMovieLocalService

#pragma mark - STMovieLocalService
+ (NSArray *)getAllMovies {
    NSMutableArray * __block objs = [[NSMutableArray alloc] init];
    NSString *sql = @"Select * From st_movie";
    FMDatabaseQueue *dbQ = [FMDatabaseQueue databaseQueueWithPath:[STDBManager sharedInstance].dbFilePath];
    [dbQ inDatabase:^(FMDatabase *db) {
        FMResultSet *resultSet = [db executeQuery:sql];
        while ([resultSet next]) {
            [objs addObject:[STMovieLocalService getObjectFromResultSet:resultSet]];
        }
        [resultSet close];
    }];
    return [objs copy];
}

+ (int64_t)addOrUpdateMovie:(STMovie *)movie {
    int64_t __block result = -1;
    NSString *sql = [NSString stringWithFormat:@"Replace Into st_movie (rowid, name, year, synopsis, thumbnail_url) Values (?, ?, ?, ?, ?)"];
    FMDatabaseQueue *dbQ = [FMDatabaseQueue databaseQueueWithPath:[STDBManager sharedInstance].dbFilePath];
    [dbQ inDatabase:^(FMDatabase *db) {
        if ([db executeUpdate:sql, [NSNumber numberWithLongLong:movie.rowid], movie.name, movie.year, movie.synopsis, movie.thumbnailImageURLString]) {
            result = (int64_t) [db lastInsertRowId];
        }
    }];
    return result;
}

+ (BOOL)removeAllMovies {
    BOOL __block result = NO;
    NSString *sql = @"Delete From st_movie";
    FMDatabaseQueue *dbQ = [FMDatabaseQueue databaseQueueWithPath:[STDBManager sharedInstance].dbFilePath];
    [dbQ inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:sql];
    }];
    return result;
}

#pragma mark - Utility
+ (STMovie *)getObjectFromResultSet:(FMResultSet *)resultSet {
    STMovie *movie = [[STMovie alloc] init];
    movie.rowid = [resultSet longLongIntForColumn:@"rowid"];
    movie.name = [resultSet stringForColumn:@"name"];
    movie.year = [resultSet stringForColumn:@"year"];
    movie.synopsis = [resultSet stringForColumn:@"synopsis"];
    movie.thumbnailImageURLString = [resultSet stringForColumn:@"thumbnail_url"];
    return movie;
}
@end	