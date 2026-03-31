import Testing

@Suite("Global Retry Demo")
struct RetryTest {
  @Test("Always fails — triggers global retry iterations")
  func flakyTestTriggersRetry() {
    #expect(Bool(false))
  }
}
