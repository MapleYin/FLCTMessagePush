//
//  Encrypted.swift
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/5/18.
//  Copyright © 2017年 Maple. All rights reserved.
//

import Foundation
import CryptoSwift

private let screct = "uguesswhatithink"
private let iv     = "uneverknowthatit"


extension String {
    var aes: AES {
        return try! AES(key: screct, iv: iv)
    }
    func ecrypt() -> String {
        let sourceString = self
        let encryptedBytes = try! aes.encrypt(Array(sourceString.utf8))
        return encryptedBytes.toBase64()!
    }
    
    func decrypt() -> String? {
        if let sourceString = try? self.decryptBase64ToString(cipher: aes) {
            return String(describing: sourceString);
        } else {
            return nil
        }
    }
}

extension Dictionary {
    func ecrypt() -> String{
        let jsonData = try! JSONSerialization.data(withJSONObject: self)
        let jsonString = String(data: jsonData, encoding: .utf8);
        return jsonString!.ecrypt()
    }
}
