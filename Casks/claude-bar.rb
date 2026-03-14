cask "claude-bar" do
  version "1.4.5"
  sha256 "ef40031b84d1109039a62c052de3af765ffcc41038992e323c988f3ebc2ff54d"

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
