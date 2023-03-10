//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<firebase_auth/FLTFirebaseAuthPlugin.h>)
#import <firebase_auth/FLTFirebaseAuthPlugin.h>
#else
@import firebase_auth;
#endif

#if __has_include(<firebase_core/FLTFirebaseCorePlugin.h>)
#import <firebase_core/FLTFirebaseCorePlugin.h>
#else
@import firebase_core;
#endif

#if __has_include(<flutter_sms_autofill/SmsAutoFillPlugin.h>)
#import <flutter_sms_autofill/SmsAutoFillPlugin.h>
#else
@import flutter_sms_autofill;
#endif

#if __has_include(<sms_autodetect/SmsAutodetectPlugin.h>)
#import <sms_autodetect/SmsAutodetectPlugin.h>
#else
@import sms_autodetect;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTFirebaseAuthPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseAuthPlugin"]];
  [FLTFirebaseCorePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseCorePlugin"]];
  [SmsAutoFillPlugin registerWithRegistrar:[registry registrarForPlugin:@"SmsAutoFillPlugin"]];
  [SmsAutodetectPlugin registerWithRegistrar:[registry registrarForPlugin:@"SmsAutodetectPlugin"]];
}

@end
