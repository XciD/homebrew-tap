cask "claude-bar" do
  version "1.4.1"
  sha256 "927d43d7954a00a43abff101c49430d0a5a95dcc19116aeaf9444ec6b464a6cd"

  url "https://github.com/XciD/claude-bar/releases/download/v#{version}/ClaudeUsageBar.zip"
  name "Claude Usage Bar"
  desc "macOS menu bar app for monitoring Claude API usage"
  homepage "https://github.com/XciD/claude-bar"

  depends_on macos: ">= :ventura"

  app "ClaudeUsageBar.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/ClaudeUsageBar.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.xcid.claude-usage-bar.plist",
  ]
end
