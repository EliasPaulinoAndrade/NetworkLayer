import Foundation
import NetworkingLayer
import XCTest

final class RequesterTests: XCTestCase {
    func testRequest_ShouldCallErasedRequesterRequest() async throws {
        let originalRequesterStub = RequestingMock()
        let sut = originalRequesterStub.asGeneric
        let targetStub = TargetMock()
        
        _ = try await sut.request(target: targetStub)
        
        let receivedTargets = try XCTUnwrap(originalRequesterStub.requestInvocations as? [TargetMock])
        
        XCTAssertEqual(receivedTargets, [targetStub])
    }
    
    func testRequest_WhenOriginalRequesterThrows_ShouldRethrow() async throws  {
        let originalRequesterStub = RequestingMock()
        let sut = originalRequesterStub.asGeneric
        let targetStub = TargetMock()
        let errorStub = MockError()
        
        originalRequesterStub.expectedReturn = .failure(errorStub)
        
        try await XCTAssert(
            try await sut.request(target: targetStub),
            shouldThrow: errorStub
        )
    }
    
    func testRequest_WhenOriginalReturnWithNoError_ShouldReturn() async throws  {
        let originalRequesterStub = RequestingMock()
        let sut = originalRequesterStub.asGeneric
        let targetStub = TargetMock()
        
        originalRequesterStub.expectedReturn = .success("result")
        
        let result = try await sut.request(target: targetStub)
        
        XCTAssertEqual(result, "result")
    }
}
