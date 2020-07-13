import UIKit

protocol Assembly {
    static func assembleModule() -> UIViewController
    static func assembleModule(with model: TransitionModel) -> UIViewController
}

/// This extension make all methods optional without using @objc
extension Assembly {
    static func assembleModule() -> UIViewController {
        fatalError("Implement assembleModule() in ModuleAssembly")
    }
    
    static func assembleModule(with model: TransitionModel) -> UIViewController {
        fatalError("Implement assembleModule(with model: TransitionModel) in ModuleAssembly")
    }
}
