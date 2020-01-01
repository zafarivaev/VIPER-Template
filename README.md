# ViperTemplate
Xcode File Template for generating VIPER modules: View, Interactor, Presenter, and Router. Written in Swift 5

# How To Install
1. Clone the repository
2. Navigate to Xcode Templates folder: ```~/Library/Developer/Xcode/Templates/```. If Templates folder doesn't exist, create it
3. Copy and paste the VIPER Module.xctemplate in Templates folder

# Use
1. Open Xcode
2. ```File -> New -> File``` or ```⌘ N```
3. Scroll down till you see ```VIPER Module``` template and choose it.
4. Set a name for your module. Examples: ```Home, Auth, SignIn```

# Generated Code

Let's suppose we wanted to create the Auth module. Here's how it would look:

### Contract
```AuthContract.swift```
```swift
import Foundation


// MARK: View Input (Presenter -> View)
protocol PresenterToViewAuthProtocol {
   
}


// MARK: View Output (View -> Presenter)
protocol ViewToPresenterAuthProtocol {
    
    var view: PresenterToViewAuthProtocol? { get set }
    var interactor: PresenterToInteractorAuthProtocol? { get set }
    var router: PresenterToRouterAuthProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorAuthProtocol {
    
    var presenter: InteractorToPresenterAuthProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterAuthProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterAuthProtocol {
    
}
```

### View
```AuthViewController.swift```
```swift
import UIKit

class AuthViewController: UIViewController {

    // MARK: - Properties
    var presenter: ViewToPresenterAuthProtocol?

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension AuthViewController: PresenterToViewAuthProtocol{
    // TODO: Implement View Output Methods
}
```

### Interactor
```AuthInteractor.swift```
```swift
import Foundation

class AuthInteractor: PresenterToInteractorAuthProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterAuthProtocol?
}
```

### Presenter
```AuthPresenter.swift```

```swift
import Foundation

class AuthPresenter: ViewToPresenterAuthProtocol {

    // MARK: Properties
    var view: PresenterToViewAuthProtocol?
    var interactor: PresenterToInteractorAuthProtocol?
    var router: PresenterToRouterAuthProtocol?
}

extension AuthPresenter: InteractorToPresenterAuthProtocol {
    
}
```

### Router
```AuthRouter.swift```
```swift
import Foundation
import UIKit

class AuthRouter: PresenterToRouterAuthProtocol {

    // MARK: Static methods
    static func createModule(vc: AuthViewController) {
        
        let presenter: ViewToPresenterAuthProtocol & InteractorToPresenterAuthProtocol = AuthPresenter()
        
        vc.presenter = presenter
        vc.presenter?.router = AuthRouter()
        vc.presenter?.view = vc
        vc.presenter?.interactor = AuthInteractor()
        
        vc.presenter?.interactor?.presenter = presenter
    }
    
}
```
