//
//  ToggleAllViewController.swift
//  3.3 Paired Assignment
//
//  Created by Jake Gloschat on 2/16/23.
//

import UIKit

class ToggleAllDevicesViewController: UIViewController {

   // MARK: - Actions
    
    @IBAction func turnAllOnButtonTapped(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name(Constants.Notifications.turnAllOn), object: nil)
    }
    
    @IBAction func turnAllOffButtonTapped(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name(Constants.Notifications.turnAllOff), object: nil)
    }
    
    
}
