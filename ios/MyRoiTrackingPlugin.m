#import "MyRoiTrackingPlugin.h"

#import <MyRoiTracking/MyRoiTracking.h>

@interface MyRoiTrackingPlugin() {
    
}

@property MyRoiTracker * tracker;

@end

@implementation MyRoiTrackingPlugin

- (void)pluginInitialize {
    [super pluginInitialize];
    
    [self setTracker:[MyRoiTracker sharedTracker]];
}

- (void)getTruid:(CDVInvokedUrlCommand*)command {
    Truid * truid = [self.tracker truid];
    NSDictionary* reply = @{@"truid":truid.truid};
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:reply];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)engagement:(CDVInvokedUrlCommand*)command {
    NSString* type = [command.arguments objectAtIndex:0];
    NSString* opt = [command.arguments objectAtIndex:1];
    id valueString = [command.arguments objectAtIndex:2];
    
    NSNumber * value;
    if ( [valueString isKindOfClass:[NSNumber class]] ) {
        value = valueString;
    } else if ( [valueString isKindOfClass:[NSString class]] ) {
        
        if ( ! [valueString isEqualToString:@""] ) {
            NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
            [f setNumberStyle:NSNumberFormatterDecimalStyle];
            value = [f numberFromString:valueString];
        }
    }
    if ( value == nil ) {
        value = @0;
    }
    
    // no need to run in background, since the tracking already async
    [self.tracker trackEngagementType:type opt:opt value:value];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)session:(CDVInvokedUrlCommand*)command {
    NSString* page = [command.arguments objectAtIndex:0];
    
    [self.tracker trackSessionPage:page];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end  