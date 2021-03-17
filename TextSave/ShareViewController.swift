//
//  ShareViewController.swift
//  TextSave
//
//  Created by Влад Калаев on 16.03.2021.
//

import UIKit
import Social
import MobileCoreServices

class ShareViewController: SLComposeServiceViewController {

    override func isContentValid() -> Bool {
        return true
    }
    
    override func didSelectPost() {
        let attachments = (self.extensionContext?.inputItems.first as? NSExtensionItem)?.attachments ?? []
        let contentType = kUTTypeData as String
        for provider in attachments {
            if provider.hasItemConformingToTypeIdentifier(contentType) {
                provider.loadItem(forTypeIdentifier: contentType, options: nil) { [weak self] (data, error) in
                    guard let strongify = self else { return }
                    guard error == nil else {
                        print(error?.localizedDescription ?? "")
                        return
                    }
                    if let text = data as? String {
                        strongify.save(text)
                    } else {
                        print("Failed to save text")
                    }
                }}
        }
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }

    override func configurationItems() -> [Any]! {
        return []
    }
      
    private func save(_ data: String) {
        let userDefaults = UserDefaults(suiteName: "group.suffixApp")
        var textArr = userDefaults?.stringArray(forKey: "textArr") ?? []
        textArr.append(data)
        userDefaults?.set(textArr, forKey: "textArr")
        userDefaults?.set(data, forKey: "text")
        userDefaults?.synchronize()
    }

}
