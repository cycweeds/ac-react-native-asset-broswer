#ifdef RCT_NEW_ARCH_ENABLED
#import "ReactNativeAssetBroswerView.h"

#import <react/renderer/components/RNReactNativeAssetBroswerViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNReactNativeAssetBroswerViewSpec/EventEmitters.h>
#import <react/renderer/components/RNReactNativeAssetBroswerViewSpec/Props.h>
#import <react/renderer/components/RNReactNativeAssetBroswerViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"
#import "Utils.h"

using namespace facebook::react;

@interface ReactNativeAssetBroswerView () <RCTReactNativeAssetBroswerViewViewProtocol>

@end

@implementation ReactNativeAssetBroswerView {
    UIView * _view;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
    return concreteComponentDescriptorProvider<ReactNativeAssetBroswerViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const ReactNativeAssetBroswerViewProps>();
    _props = defaultProps;

    _view = [[UIView alloc] init];

    self.contentView = _view;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<ReactNativeAssetBroswerViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<ReactNativeAssetBroswerViewProps const>(props);

    if (oldViewProps.color != newViewProps.color) {
        NSString * colorToConvert = [[NSString alloc] initWithUTF8String: newViewProps.color.c_str()];
        [_view setBackgroundColor: [Utils hexStringToColor:colorToConvert]];
    }

    [super updateProps:props oldProps:oldProps];
}

Class<RCTComponentViewProtocol> ReactNativeAssetBroswerViewCls(void)
{
    return ReactNativeAssetBroswerView.class;
}

@end
#endif
