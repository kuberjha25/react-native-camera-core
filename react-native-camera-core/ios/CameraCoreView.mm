#import "CameraCoreView.h"

#import <React/RCTConversions.h>

#import <react/renderer/components/CameraCoreViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/CameraCoreViewSpec/Props.h>
#import <react/renderer/components/CameraCoreViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"

using namespace facebook::react;

@implementation CameraCoreView {
    UIView * _view;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
    return concreteComponentDescriptorProvider<CameraCoreViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const CameraCoreViewProps>();
    _props = defaultProps;

    _view = [[UIView alloc] init];

    self.contentView = _view;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<CameraCoreViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<CameraCoreViewProps const>(props);

    if (oldViewProps.color != newViewProps.color) {
        [_view setBackgroundColor: RCTUIColorFromSharedColor(newViewProps.color)];
    }

    [super updateProps:props oldProps:oldProps];
}

@end
