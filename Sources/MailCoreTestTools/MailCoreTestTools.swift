//
//  Boost.swift
//  MailCore
//
//  Created by Ondrej Rafaj on 19/3/2018.
//

import Foundation
import Vapor
@testable import Service
@_exported import MailCore
import VaporTestTools


public class MailerMock: MailerService {
    public func send(_ messages: [Mailer.Message], on req: Request) throws -> EventLoopFuture<[(Mail, Mailer.Result)]> {
        throw Abort(.notImplemented, reason: "Sending mass email mock is not currently supported.")
    }
    
    public var result: Mailer.Result = .success
    public var receivedMessage: Mailer.Message?
    public var receivedRequest: Request?
    
    // MARK: Initialization
    
    @discardableResult public init(services: inout Services) {
        services.remove(type: Mailer.self)
        services.register(self, as: MailerService.self)
    }
    
    // MARK: Public interface
    
    public func send(_ message: Mailer.Message, on req: Request) throws -> Future<Mailer.Result> {
        receivedMessage = message
        receivedRequest = req
        return req.eventLoop.newSucceededFuture(result: result)
    }
    
    public func clear() {
        result = .success
        receivedMessage = nil
        receivedRequest = nil
    }
    
}
