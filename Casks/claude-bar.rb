cask "claude-bar" do
  version "1.3.0"
  sha256 "b274cc3c5eab23d0eee059223ca6e977fba95baf654637fc853b900d2cd4bce5"

  url "https://github.com/XciD/claude-bar/releases/download/v#{version}/ClaudeUsageBar.zip"
  name "Claude Usage Bar"
  desc "macOS menu bar app for monitoring Claude API usage"
  homepage "https://github.com/XciD/claude-bar"

  depends_on macos: ">= :ventura"

  app "ClaudeUsageBar.app"

  zap trash: [
    "~/Library/Preferences/com.xcid.claude-usage-bar.plist",
  ]
end
