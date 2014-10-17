#import <Cordova/CDVPlugin.h>

@interface MyRoiTrackingPlugin : CDVPlugin

- (void)getTruid:(CDVInvokedUrlCommand*)command;

- (void)engagement:(CDVInvokedUrlCommand*)command;

- (void)session:(CDVInvokedUrlCommand*)command;

@end