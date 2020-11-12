# OpenTok Annotations Accelerator Pack for iOS

<img src="https://assets.tokbox.com/img/vonage/Vonage_VideoAPI_black.svg" height="48px" alt="Tokbox is now known as Vonage" />

# **This project is deprecated**
## The OpenTok Annotations Accelerator Pack for iOS project is now a part of [Accelerator Core iOS](https://github.com/opentok/accelerator-core-ios)


This document describes how to use the OpenTok Annotations Accelerator Pack for iOS.

Inside it you will find the following sections:

* [Prerequisites](#prerequisites): A checklist of everything you need to get started.
* [Quickstart](#quickstart): A step by step tutorial to help you start developing using the OpenTok Annotations Accelerator Pack for iOS.
* [Exploring the code](#exploring-the-code): Detailed information about APIs, class design and configuration of this accelerator pack.

## Prerequisites

To be prepared to develop with the OpenTok Annotations Accelerator Pack for iOS:

1. Get values for **API Key**, **Session ID**, and **Token**. See [Obtaining OpenTok Credentials](#obtaining-opentok-credentials) for important information.
1. Install Xcode version 5 or later, with ARC enabled.
2. Your device must be running iOS 8 or later.

### Obtaining OpenTok Credentials

To use OpenTok's framework you need a Session ID, Token, and API Key you can get these values at the [OpenTok Developer Dashboard](https://dashboard.tokbox.com/) . For production deployment, you must generate the Session ID and Token values using one of the [OpenTok Server SDKs](https://tokbox.com/developer/sdks/server/).

## Quickstart
To get up and running quickly with your app, go through the following steps:

1. [Add the library](#add-the-library).
2. [Configure and build the app](#configure-and-build-the-app).

### Add the library

To add the library and start with your development, go through the following steps using CocoaPods:

1. Add the following line to your pod file: ` pod 'OTAnnotationAccelerator'  `
2. In a terminal prompt, navigate into your project directory and type `pod install`. (Sometimes, pod update is magical)
3. Reopen your project using the new `*.xcworkspace` file.

_**NOTE:** For more information about CocoaPods, including installation instructions, visit [CocoaPods Getting Started](https://guides.cocoapods.org/using/getting-started.html#getting-started)._

### Configure and build the app

Configure the sample app code. Then, build and run the app.

1. Have at hand your values for **API Key**, **Session ID**, and **Token**. See [Obtaining OpenTok Credentials](#obtaining-opentok-credentials).

1. Replace the following empty strings with the corresponding **API Key**, **Session ID**, and **Token** values in `AppDelegate.m`:

    ```objc
    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

        // Override point for customization after application launch.    
        [OTAcceleratorSession setOpenTokApiKey:@""
                                     sessionId:@""
                                         token:@""];
        return YES;
    }
    ```

1. Use Xcode to build and run the app on an iOS simulator or a device.

## Exploring the code

For detail about the APIs used to develop this accelerator pack, see the [OpenTok iOS SDK Reference](https://tokbox.com/developer/sdks/ios/reference/).

_**NOTE:** This accelerator pack collects anonymous usage data for internal TokBox purposes only. Please do not modify or remove any logging code from this sample application._

### Class design

The following classes represent the software design for the OpenTok Annotations Accelerator Pack.

| Class                                  | Description                                                                                                                                                           |
| -------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `OTAnnotator`                          | The core component for enabling remote annotation across devices and platforms.                                                                                       |
| `OTAnnotationScrollView`               | Provides essentials components for annotating on either the entire screen or a specified portion of the screen.                                                       |
| `OTAnnotationToolbarView`              | A convenient annotation toolbar that is optionally available for your development. As an alternative, you can create your own toolbar using `OTAnnotationScrollView`. |
| `OTFullScreenAnnotationViewController` | A convenient view controller enables you to annotate the whole screen immediately.                                                                                    |


### Annotation features

The `OTAnnotationScrollView` class is the backbone of the annotation features in this Sample.


```objc
self.annotationView = [[OTAnnotationScrollView alloc] init];
self.annotationView.frame = <# desired frame #>;
[self.annotationView initializeToolbarView];
self.annotationView.toolbarView.frame = <# desired frame #>;
```

If you would like to be annotated on either the entire screen or a specified portion of the screen:

```objc
self.annotator = [[OTAnnotator alloc] init];
[self.annotator connectForReceivingAnnotationWithSize:<# desired size #>
                                    completionHandler:^(OTAnnotationSignal signal, NSError *error) {
                                        if (signal == OTAnnotationSessionDidConnect){
                                            self.annotator.annotationScrollView.frame = self.view.bounds;
                                            [self.view addSubview:self.annotator.annotationScrollView];
                                        }
                                    }];

self.annotator.dataReceivingHandler = ^(NSArray *data) {
    NSLog(@"%@", data);
};
```

If you would like to annotate on a remote client's screen:

```objc
self.annotator = [[OTAnnotator alloc] init];
[self.annotator connectForSendingAnnotationWithSize:self.sharer.subscriberView.frame.size
                                completionHandler:^(OTAnnotationSignal signal, NSError *error) {
    
                                    if (signal == OTAnnotationSessionDidConnect){
        
                                        // configure annotation view
                                        self.annotator.annotationScrollView.frame = self.view.bounds;
                                        [self.view addSubview:self.annotator.annotationScrollView];

                                        // self.sharer.subscriberView is the screen shared from a remote client.
                                        // It does not make sense to `connectForSendingAnnotationWithSize` if you don't receive a screen sharing.
                                        [self.annotator.annotationScrollView addContentView:self.sharer.subscriberView];
        
                                        // configure annotation feature
                                        self.annotator.annotationScrollView.annotatable = YES;
                                        self.annotator.annotationScrollView.annotationView.currentAnnotatable = [OTAnnotationPath pathWithStrokeColor:[UIColor yellowColor]];
                                    }
                                }];

self.annotator.dataSendingHandler = ^(NSArray *data, NSError *error) {
    NSLog(@"%@", data);
};
```

## 3rd Party Libraries

- [LHToolbar](https://github.com/Lucashuang0802/LHToolbar)

## Development and Contributing

Interested in contributing? We :heart: pull requests! See the [Contribution](CONTRIBUTING.md) guidelines.

## Getting Help

We love to hear from you so if you have questions, comments or find a bug in the project, let us know! You can either:

- Open an issue on this repository
- See <https://support.tokbox.com/> for support options
- Tweet at us! We're [@VonageDev](https://twitter.com/VonageDev) on Twitter
- Or [join the Vonage Developer Community Slack](https://developer.nexmo.com/community/slack)

## Further Reading

- Check out the Developer Documentation at <https://tokbox.com/developer/>