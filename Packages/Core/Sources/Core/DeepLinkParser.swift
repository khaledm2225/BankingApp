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
            
        case "login":
            return .login
            
        case "transactions":
            guard let id = accountID(from: url) else { return nil }
            return .transactions(accountID: id)
            
        default:
            return nil
        }
        
    }
    
    
    private static func accountID(from url: URL) -> String? {
        URLComponents(url: url, resolvingAgainstBaseURL: false)?
            .queryItems?
            .first(where: { $0.name == "accountID" })?
            .value
    }
    
}
