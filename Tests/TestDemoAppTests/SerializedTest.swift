import Testing

@Suite("Global Serialization Demo")
struct SerializedTest {
  @Test("Step 1 — runs sequentially when serialized")
  func stepOne() async throws {
    try await Task.sleep(for: .seconds(1))
    #expect(1 == 1)
  }

  @Test("Step 2 — waits for Step 1 to finish")
  func stepTwo() async throws {
    try await Task.sleep(for: .seconds(1))
    #expect(1 == 1)
  }

  @Test("Step 3 — waits for Step 2 to finish")
  func stepThree() async throws {
    try await Task.sleep(for: .seconds(1))
    #expect(1 == 1)
  }
}
