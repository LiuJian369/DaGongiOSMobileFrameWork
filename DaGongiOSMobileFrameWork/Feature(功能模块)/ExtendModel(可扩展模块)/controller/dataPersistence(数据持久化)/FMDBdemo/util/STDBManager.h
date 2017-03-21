#import <Foundation/Foundation.h>

@interface STDBManager : NSObject

@property (strong, readonly, nonatomic) NSString *dbFilePath;

+ (instancetype)sharedInstance;

- (void)setupDB;

@end