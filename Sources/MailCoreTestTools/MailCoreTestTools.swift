import Vapor
@_exported import MailCore


public class MailerMock: MailerService {
    
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
