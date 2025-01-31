// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "MailCore",
    products: [
        .library(name: "MailCore", targets: ["MailCore"]),
        .library(name: "MailCoreTestTools", targets: ["MailCoreTestTools"])
    ],
    dependencies: [
        .package(name: "Vapor", url: "https://github.com/vapor/vapor.git", from: "3.3.1"),
        .package(name: "Mailgun", url: "https://github.com/twof/VaporMailgunService.git", from: "1.8.1"),
        .package(name: "SendGrid", url: "https://github.com/vapor-community/sendgrid-provider.git", from: "3.0.5"),
        .package(name: "SwiftSMTP", url: "https://github.com/IBM-Swift/Swift-SMTP.git", from: "5.1.2"),
        .package(url: "https://github.com/IBM-Swift/LoggerAPI.git", .upToNextMinor(from: "1.8.0")),
        .package(url: "https://github.com/LiveUI/VaporTestTools.git", from: "0.1.5")
    ],
    targets: [
        .target(name: "MailCore", dependencies: [
                "Vapor",
                "Mailgun",
                "SendGrid",
                "SwiftSMTP"
            ]
        ),
        .target(name: "MailCoreTestTools", dependencies: [
                "Vapor",
                "VaporTestTools",
                "MailCore"
            ]
        ),
        .testTarget(name: "MailCoreTests", dependencies: [
                "MailCore",
                "MailCoreTestTools",
                "VaporTestTools"
            ]
        )
    ]
)
