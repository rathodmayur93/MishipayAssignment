//
//  CameraPermission.swift
//  MishiPay
//
//  Created by ds-mayur on 02/01/2021.
//

import AVFoundation
import UIKit.UIAlertController

struct CameraPermission {
    
    var vc : ParentViewController
    
    enum Constants {
        //Dialog box Button text
        static let alertPositiveBTText = "Okay"
        public static let cancel = "Cancel"
        public static let setting = "Settings"
        
        //Camera permission error messages
        static let cameraPermissionSetting = "To enable access, go to Settings > Privacy > Camera and turn on Camera access for this app."
        static let cameraRestricted = "The user can't give camera access due to some restriction."
        static let cameraPermissoinDefaultError = "Something has wrong due to we can't access the camera."
        static let cameraDenied = "The user has denied previously to access the camera."
        
        //Dialog box title text
        public static let alertTitleError = "Error"
    }
    
    init(vc viewController: ParentViewController) {
        self.vc = viewController
        
        //Check permission and handle appropiately
        self.openCamera()
    }
    
    /// Check current status of the camera permission and handle it appropriately
    public func openCamera() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized: // the user has already authorized to access the camera.
            debugPrint("Authorize")
        
        case .notDetermined: // the user has not yet asked for camera access.
            AVCaptureDevice.requestAccess(for: .video) { (granted) in
                if granted { // if user has granted to access the camera.
                    debugPrint("the user has granted to access the camera")
                } else {
                    debugPrint("the user has not granted to access the camera")
                }
            }
            
        case .denied:
            debugPrint("the user has denied previously to access the camera.")
            if #available(iOS 10.0, *) {
                presentCameraSettings()
            } else {
                // Fallback on earlier versions
                vc.showAlert(title: Constants.alertPositiveBTText,
                          message: Constants.cameraPermissionSetting,
                          fromController: vc)
            }
            
        case .restricted:
            debugPrint("the user can't give camera access due to some restriction.")
            self.handleDismiss(message: Constants.cameraRestricted)
            
        default:
            debugPrint("something has wrong due to we can't access the camera.")
            self.handleDismiss(message: Constants.cameraPermissoinDefaultError)
        }
    }
    
    //Handle the dismiss method
    private func handleDismiss(message msg : String) {
        DispatchQueue.main.async {
            debugPrint("Show alert dialog")
            vc.showAlert(title: Constants.alertPositiveBTText,
                         message: msg,
                         fromController: vc)
        }
    }
    
    /// This function will show a popup to user from where user can goto settings and give the permission
    @available(iOS 10.0, *)
    private func presentCameraSettings() {
        let alertController = UIAlertController(title: Constants.alertTitleError,
                                                message: Constants.cameraDenied,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: Constants.cancel, style: .default))
        alertController.addAction(UIAlertAction(title: Constants.setting, style: .cancel) { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: { _ in
                    // Handle
                })
            }
        })
        
        vc.present(alertController, animated: true)
    }
}
