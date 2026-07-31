//
//  File.swift
//  Core
//
//  Created by Khaled Mohamed on 01/08/2026.
//

import Foundation
public enum DeepLinkParser {
    
    public static func route(from url: URL) -> Route? {
        
        switch url.host {
        case "home" :
            return .home
        default:
            return nil
        }
        
    }
    
}
