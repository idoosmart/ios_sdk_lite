#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
#
Pod::Spec.new do |s|
  s.name             = 'IDOSDK-lite'
  s.version          = '4.0.46'
  s.summary          = 'ido sdk'
  s.description      = <<-DESC
  ido sdk
                       DESC
  s.homepage         = 'http://www.idoosmart.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'IDO' => 'huc@idosmart.com' }

  s.source           = { :git => 'https://github.com/idoosmart/ios_sdk_lite.git', :tag => s.version.to_s }

  s.platform         = :ios, '9.0'
  s.libraries        = 'iconv','z','c++'

  s.vendored_frameworks = [
    'App.xcframework',
    'Flutter.xcframework',
    'FlutterPluginRegistrant.xcframework',
    'native_channel.xcframework',
    'protocol_channel.xcframework',
    'protocol_c.framework',
    'IDOUtils.framework'
   ]
   
  s.resources = ['protocol_channel.xcframework/**/icon_assets.bundle']

   # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386'
  }

  s.xcconfig = {
      'GCC_PREPROCESSOR_DEFINITIONS' => [
      'PLATFORM_TYPE=2',
      'HAVE_INTTYPES_H',
      'HAVE_PKCRYPT',
      'HAVE_STDINT_H',
      'HAVE_WZAES',
      'HAVE_ZLIB',
      'VAR_ARRAYS',
      'USE_ALLOCA',
      'NONTHREADSAFE_PSEUDOSTACK',
      'OPUS_BUILD',
      'STDC_HEADERS'
      ],
    }

  s.swift_version = '5.0'

 end
