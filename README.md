# CustomPresentation
iOS Mail/Music app like Presentation animation. Written in Objective-C.


## How To Use

1. Clone/Download the master-repo.

2. Import ```"CustomAnimation"``` folder into your project.

3. Add ```#import "OverlayTransitioningDelegate.h"```

4. Create ```OverlayTransitioningDelegate``` 
```
    @property (nonatomic, strong) OverlayTransitioningDelegate *animationDelegate;
```

5. Before presenting view controller add these lines
```
    self.animationDelegate = [[OverlayTransitioningDelegate alloc]init];
    viewController.transitioningDelegate = self.animationDelegate;
    viewController.modalPresentationStyle = UIModalPresentationCustom;
```
