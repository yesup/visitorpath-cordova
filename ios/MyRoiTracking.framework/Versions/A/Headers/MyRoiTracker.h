
#import <Foundation/Foundation.h>
#import <MyRoiTracking/Truid.h>

@interface MyRoiTracker : NSObject {
    
}

@property (readonly) NSString * apiVersion;

@property (readonly) Truid * truid;

+ (MyRoiTracker *)sharedTracker;

- (void)trackSessionPage:(NSString *)page;

- (void)trackEngagementType:(NSString *)type opt:(NSString *)opt value:(NSNumber *)value;

@end