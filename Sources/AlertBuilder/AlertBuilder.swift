//
//  AlertBuilder.swift
//  SingleMG
//
//  Created by Mauricio Guerrero Vega on 16/08/21.
//

import UIKit


public class AlertBuilder {
    public typealias Completion = () -> Void
    public typealias ValueCompletion = (String) -> Void
    

    public static func getMessageAlert(title: String, message: String, completion: Completion? = nil, buttonHandler: Completion? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Aceptar", style: .default, handler: {
            _ in
            buttonHandler?()
        })
        alert.addAction(action)
        return alert
    }
    
    static func getConfirmationAlert(title: String, message: String, successFunc: Completion?, cancelFunc: Completion? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { _ in
            cancelFunc?()
        }
        let successAction = UIAlertAction(title: "Continuar", style: .default) { _ in
            successFunc?()
        }
        alert.addAction(cancelAction)
        alert.addAction(successAction)
        return alert
    }
    
    static func getDestructiveConfirmationAlert(title: String, message: String, successFunc: Completion?, cancelFunc: Completion? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .destructive) { _ in
            cancelFunc?()
        }
        let successAction = UIAlertAction(title: "Continuar", style: .default) { _ in
            successFunc?()
        }
        alert.addAction(cancelAction)
        alert.addAction(successAction)
        return alert
    }
    
    static func getActionsAlert(title: String, message: String, actions: [UIAlertAction]) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        for i in 0..<actions.count {
            alert.addAction(actions[i])
        }
        return alert
    }
    
    static func getTextFieldAlert(title: String, message: String, placeholder: String, autoCapitalization: UITextAutocapitalizationType = .words, autoCorrection: UITextAutocorrectionType = .yes, successFunc: ValueCompletion?, cancelFunc: Completion?) -> UIAlertController {
        var alertTextField: UITextField?
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { _ in
            cancelFunc?()
        }
        let addAction = UIAlertAction(title: "Aceptar", style: .default) { (action) in
            let text = alertTextField!.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            successFunc?(text)
        }
        alert.addTextField { (textField) in
            textField.placeholder = placeholder
            textField.autocapitalizationType = autoCapitalization
            textField.autocorrectionType = autoCorrection
            alertTextField = textField
        }
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        return alert
    }
    
    static func getLoadAlert() -> UIAlertController {
        let alertLoad = UIAlertController(title: "Espere un momento...\n\n\n\n", message: nil, preferredStyle: UIAlertController.Style.alert)
        
        let indicador: UIActivityIndicatorView = UIActivityIndicatorView.init()
        indicador.color = UIColor.black
        alertLoad.view.addSubview(indicador)
        indicador.center = CGPoint(x: (alertLoad.view.bounds.width)/2, y: (alertLoad.view.bounds.height)/2)
        indicador.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        indicador.startAnimating()
        
        return alertLoad
    }
    
}
