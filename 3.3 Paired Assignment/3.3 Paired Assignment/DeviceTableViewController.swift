//
//  DeviceTableViewController.swift
//  3.3 Paired Assignment
//
//  Created by Jake Gloschat on 2/15/23.
//

import UIKit

class DeviceTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DeviceController.shared.devices.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "deviceCell", for: indexPath) as? DeviceTableViewCell else { return UITableViewCell() }
        let device = DeviceController.shared.devices[indexPath.row]
        cell.updateViews(device: device)
        cell.delegate = self
        return cell
    }
    
    // MARK: - Functions for UIAlert
    
    private func presentNewDeviceAlertController() {
        let alertController = UIAlertController(title: "New Device", message: "Create your new device, nerd!", preferredStyle: .alert)
        alertController.addTextField { textField in textField.placeholder = "Your device here..."
        }
        
        // MARK: - Actions
        
        
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) {
            _ in guard let deviceTextField = alertController.textFields?.first,
                       let device = deviceTextField.text, !device.isEmpty else { return }
            DeviceController.shared.createDevice(device: device)
            self.tableView.reloadData()
        }
        alertController.addAction(dismissAction)
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        presentNewDeviceAlertController()
    }
}


extension DeviceTableViewController: DeviceTableViewCellDelegate {
    func isOnSwitchToggled(_ cell: DeviceTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let device = DeviceController.shared.devices[indexPath.row]
        DeviceController.shared.toggleIsOn(toggle: device)
        cell.updateViews(device: device)
    }
    
    
}
