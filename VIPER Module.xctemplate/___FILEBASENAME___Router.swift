//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import UIKit

class ___VARIABLE_ModuleName___Router: PresenterToRouter___VARIABLE_ModuleName___Protocol {

    // MARK: Static methods
    static func createModule(vc: ___VARIABLE_ModuleName___ViewController) {
        
        let presenter: ViewToPresenter___VARIABLE_ModuleName___Protocol & InteractorToPresenter___VARIABLE_ModuleName___Protocol = ___VARIABLE_ModuleName___Presenter()
        
        vc.presenter = presenter
        vc.presenter?.router = ___VARIABLE_ModuleName___Router()
        vc.presenter?.view = vc
        vc.presenter?.interactor = ___VARIABLE_ModuleName___Interactor()
        
        vc.presenter?.interactor?.presenter = presenter
    }
    
}
