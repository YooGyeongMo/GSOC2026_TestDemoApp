import Testing

@Suite("Global Tags Demo")
struct TagTest {
  @Test("No local tag — global 'ci' tag auto-applied")
  func noLocalTagReceivesGlobal() { #expect(Bool(true)) }

  @Test("No local tag — global 'ci' tag auto-applied")
  func anotherTestReceivesGlobal() { #expect(Bool(true)) }

  @Test("Has local tag — merges with global (union)")
  func localTagMergesWithGlobal() { #expect(Bool(true)) }
}
