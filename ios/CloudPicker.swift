//
//  OneTrustWeb.swift
//  react-native-cloud-file-picker
//
//  Created by Hunaid Hassan on 20/10/2020.
//

@objc(CloudPicker)
public class CloudPicker: NSObject {
    static let kOpenUrlNotification = "kOpenUrlNotification"
    var dBChooser: DBChooser?
    
    override init() {
        super.init()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleOpenURLNotification(_:)), name: NSNotification.Name.init(CloudPicker.kOpenUrlNotification), object: nil)
    }
    
    @objc public class func handle(url: URL) -> Bool {
        NotificationCenter.default.post(name: NSNotification.Name.init(kOpenUrlNotification), object: url)
        
        return true
    }
    
    @objc func handleOpenURLNotification(_ notification: Notification) {
        if let url = notification.object as? URL {
            dBChooser?.handleOpen(url)
        }
    }
    
    @objc(pickDropBoxFile:resolver:rejecter:)
    func pickDropBoxFile(appKey: String, resolver: RCTPromiseResolveBlock, rejecter: RCTPromiseRejectBlock) {
        if (dBChooser == nil) {
            dBChooser = DBChooser.init(appKey: appKey)
        }
        guard let viewController = UIApplication.shared.delegate?.window??.rootViewController else {
            rejecter("1", "rootViewController is nil", nil)
            return
        }
        dBChooser!.open(for: DBChooserLinkTypeDirect, from: viewController, completion: { (results) in
            print(results)
        })
    }
}
