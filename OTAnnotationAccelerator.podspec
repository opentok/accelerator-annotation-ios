Pod::Spec.new do |s|
  s.name             = "OTAnnotationAccelerator"
  s.version          = "1.0.0-beta4"
  s.summary          = "OpenTok Annotations Accelerator Pack enables users to annotate their screens."

  s.description      = "This document describes how to use the OpenTok Annotations Accelerator Pack for iOS. Through the exploration of the OpenTok Annotations Sample App, you will learn best practices for annotating on an iOS mobile device."

  s.homepage         = "https://vonage.com/"
  s.license          = 'MIT'
  s.author           = { "Vonage" => "devrel@vonage.com" }
  s.source           = { :git => "https://github.com/opentok/accelerator-annotation-ios.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/vonagedev'

  s.ios.deployment_target = '11.0'

  s.source_files = 'OTAnnotationAccelerator/**/*'

  s.resource_bundles = {
    'OTAnnotationAcceleratorBundle' => ['OTAnnotationAcceleratorBundle/**/*.xib', 'OTAnnotationAcceleratorBundle/Assets.xcassets']
  }

  s.static_framework = true
  s.dependency 'LHToolbar', '1.3.0-beta'
  s.dependency 'OTAcceleratorCore', '2.0.0'
end
