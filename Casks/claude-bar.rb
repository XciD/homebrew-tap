cask "claude-bar" do
  version "1.4.3"
  sha256 "299c147070f6d617c46536da69a623eb4ba3b2fa4b1f9124c5bf15a8a9afef3e"

  url "https://github.com/XciD/claude-bar/releases/download/v#{version}/ClaudeUsageBar.zip"
  name "Claude Usage Bar"
  desc "macOS menu bar app for monitoring Claude API usage"
  homepage "https://github.com/XciD/claude-bar"

  depends_on macos: ">= :ventura"

  app "ClaudeUsageBar.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/ClaudeUsageBar.app"]
    system_command "/usr/bin/killall", args: ["ClaudeUsageBar"], must_succeed: false
    system_command "/usr/bin/open", args: ["#{appdir}/ClaudeUsageBar.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.xcid.claude-usage-bar.plist",
  ]
end
