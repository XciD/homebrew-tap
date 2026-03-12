cask "claude-bar" do
  version "1.4.2"
  sha256 "2840c02263fca69881c2509d3f60f34e697697b75b735979540379490c8977b9"

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
