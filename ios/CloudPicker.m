#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(CloudPicker, NSObject)

RCT_EXTERN_METHOD(pickDropBoxFile:(NSString *)appId resolver:(RCTPromiseResolveBlock)resolver rejecter:(RCTPromiseRejectBlock)rejecter)

@end
