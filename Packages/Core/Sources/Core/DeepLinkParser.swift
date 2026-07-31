import Foundation

private enum DeepLinkHost: String {
    case home
    case login
    case transactions
}

public enum DeepLinkParser {

    public static func route(from url: URL) -> Route? {
        guard
            let host = url.host,
            let deepLinkHost = DeepLinkHost(rawValue: host)
        else { return nil }

        switch deepLinkHost {
        case .home:
            return .home

        case .login:
            return .login

        case .transactions:
            guard let id = accountID(from: url) else { return nil }
            return .transactions(accountID: id)
        }
    }

    private static func accountID(from url: URL) -> String? {
        URLComponents(url: url, resolvingAgainstBaseURL: false)?
            .queryItems?
            .first(where: { $0.name == "accountID" })?
            .value
    }
}
