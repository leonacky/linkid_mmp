//
//  DeepLinkItem.swift
//  linkid_mmp
//
//  Created by Tuan Dinh on 28/09/2023.
//

import Foundation

public class DeepLinkBuilderResult {
    public var shortLink: String
    public var longLink: String
    
    init(shortLink: String, longLink: String) {
        self.shortLink = shortLink
        self.longLink = longLink
    }
}