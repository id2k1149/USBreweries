//
//  MainViewController+alertController.swift
//  USBreweries
//
//  Created by Max Franz Immelmann on 12/19/22.
//

import UIKit

extension MainViewController {
    
    func citySearchAlertController(withTitle title: String?,
                                      message: String?,
                                      style: UIAlertController.Style,
                                      completionHandler: @escaping(String) -> Void) {
        
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: style
        )
        
        alertController.addTextField { textField in
            let cities = ["San Francisco",
                          "Los Angeles",
                          "New York",
                          "Boston",
                          "Dallas",
                          "Atlanta"]
            textField.placeholder = cities.randomElement()
        }
        
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = alertController.textFields?.first
            guard let cityName = textField?.text else { return }
            
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(search)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
    
    func showAlertController(states: [String], completionHandler: @escaping(String) -> Void )
    {
        
        let alertController = UIAlertController(title: "Select Options", message: "Choose one state", preferredStyle: .alert)
        
        
        
        for state in states {
            let action = UIAlertAction(title: state, style: .default, handler: { (action) in
                // add your code here to handle the selection of the option
                completionHandler(state)
            })
            alertController.addAction(action)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func showAlertController2(states: [String] )
        {
            //simple alert dialog
            let alertController = UIAlertController(title: "Choose state", message: "", preferredStyle: UIAlertController.Style.alert);
            // Add Action
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil));
            //show it
            states.forEach { state in
                let btnImage    = UIImage(named: "checkmark.square.fill")
                let imageButton : UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
                imageButton.setBackgroundImage(btnImage, for: UIControl.State())
                imageButton.addTarget(self, action: #selector(MainViewController.checkBoxAction(_:)), for: .touchUpInside)
                alertController.view.addSubview(imageButton)
            }
            
            
            self.present(alertController, animated: false, completion: { () -> Void in

                })
        }


    @objc func checkBoxAction(_ sender: UIButton)
    {
        if sender.isSelected
        {
            sender.isSelected = false
            let btnImage    = UIImage(named: "checkBoxImage")!
            sender.setBackgroundImage(btnImage, for: UIControl.State())
        } else {
            sender.isSelected = true
            let btnImage    = UIImage(named: "unCheckBoxImage")!
            sender.setBackgroundImage(btnImage, for: UIControl.State())
        }
    }
    
    func stateSearchAlertController(withTitle title: String?,
                                      message: String?,
                                      style: UIAlertController.Style,
                                      completionHandler: @escaping(String) -> Void) {
        
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: style
        )
        
//        alertController.add{ textField in
//            let cities = ["San Francisco",
//                          "Los Angeles",
//                          "New York",
//                          "Boston",
//                          "Dallas",
//                          "Atlanta"]
//            textField.placeholder = cities.randomElement()
//        }
        
//        alertController.addTextField { textField in
//            let cities = ["San Francisco",
//                          "Los Angeles",
//                          "New York",
//                          "Boston",
//                          "Dallas",
//                          "Atlanta"]
//            textField.placeholder = cities.randomElement()
//        }
        
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = alertController.textFields?.first
            guard let cityName = textField?.text else { return }
            
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(search)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
}
