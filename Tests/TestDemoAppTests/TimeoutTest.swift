import Testing

@Suite("Global Timeout Demo")
struct TimeoutTest {
  @Test("Slow operation exceeds global 5s limit — TIMEOUT expected")
  func slowOperationExceedsGlobalLimit() async throws {
    try await Task.sleep(for: .seconds(10))
    #expect(1 == 1)
  }

  @Test("Fast operation completes within limit — passes")
  func fastOperationWithinLimit() {
    #expect(1 + 1 == 2)
  }
}
