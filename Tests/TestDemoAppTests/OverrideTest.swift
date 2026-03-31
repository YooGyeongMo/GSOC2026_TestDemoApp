import Testing

@Suite("Local Override Demo")
struct OverrideTest {
  @Test("Local 1min overrides global 5s — local wins", .timeLimit(.minutes(1)))
  func localTraitOverridesGlobal() async throws {
    try await Task.sleep(for: .seconds(8))
    #expect(1 == 1)
  }

  @Test("No local trait — global 5s applies → TIMEOUT")
  func globalFallbackApplied() async throws {
    try await Task.sleep(for: .seconds(8))
    #expect(1 == 1)
  }
}
