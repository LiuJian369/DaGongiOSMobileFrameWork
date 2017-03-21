#import "STDBManager.h"
#import <FMDB/FMDB.h>

static NSString * const STDBFileName = @"stdb.sqlite";

@interface STDBManager ()

@property (strong, readwrite, nonatomic) NSString *dbFilePath;
@end

@implementation STDBManager

#pragma mark - Property
- (NSString *)dbFilePath {
    if (!_dbFilePath) {
        NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentFolderPath = searchPaths[0];
        _dbFilePath = [documentFolderPath stringByAppendingPathComponent:STDBFileName];
    }
    return _dbFilePath;
}

#pragma mark - Lifecycle
+ (instancetype)sharedInstance {
    static STDBManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

#pragma mark - Utility
- (void)setupDB {
    if ([self isDBFileExist]) {
        return;
    }
    BOOL isSuccess = [self copyDBFileFromMainBundle];
    if (isSuccess) {
        return;
    }
    if ([self createDB]) {
        [self updateDB];
    }
}

- (BOOL)isDBFileExist {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.dbFilePath];
}


- (BOOL)copyDBFileFromMainBundle {
    BOOL result = NO;
    // Not find db file, need to copy backup db file.
    NSString *backupDBPath = [[NSBundle mainBundle] pathForResource:@"stdb" ofType:@"sqlite"];
    if (!backupDBPath) {
        // Not find backup db file.
        result = NO;
    } else {
        BOOL isSuccess = [[NSFileManager defaultManager] copyItemAtPath:backupDBPath toPath:self.dbFilePath error:nil];
        if (!isSuccess) {
            // Copy backup db file failed.
            result = NO;
        } else {
            result = YES;
        }
    }
    return result;
}

- (BOOL)createDB {
    if ([FMDatabase databaseWithPath:self.dbFilePath]) {
        return YES;
    }
    return NO;
}

- (void)updateDB {
    FMDatabaseQueue *dbQ = [FMDatabaseQueue databaseQueueWithPath:self.dbFilePath];
    [dbQ inTransaction:^(FMDatabase *db, BOOL *rollback) {
        [db executeUpdate:[NSString stringWithFormat:@"Create Table If Not Exists st_movie (rowid integer primary key not null, name text, year text, synopsis text, thumbnail_url text)"]];
    }];
}
@end