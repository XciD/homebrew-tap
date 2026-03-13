cask "claude-bar" do
  version "1.4.4"
  sha256 "3151e0562d342690afced4f9757f35ec33380bf4939f952ffc79b7057f201a3a"

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
