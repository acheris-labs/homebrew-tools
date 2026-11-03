# Cask template for acheris-labs/homebrew-tools (Casks/ush.rb).
# Rendered by the release workflow with envsubst: VERSION and SHA_ZIP come from
# the release's notarized zip, which holds the ush binary and nothing else.
cask "ush" do
  version "0.1.3"
  sha256 "2f45203a0e19bd496794a5ab10e0dab28a0fcc7c5548b44ca4e86ebae66c489c"

  url "https://github.com/acheris-labs/ushell/releases/download/v#{version}/ush-#{version}.zip"
  name "ush"
  desc "Named, browsable terminal sharing through a rendezvous you run"
  homepage "https://github.com/acheris-labs/ushell"

  depends_on arch: :arm64

  binary "ush"

  # No uninstall step for kept sessions (`ush share -k`): they are the user's
  # shells, and an upgrade runs uninstall too.

  # `brew uninstall --zap ush`: the config, the log, kept sessions' sockets.
  # The SSH key ush init wrote stays; it may be in use elsewhere.
  zap trash: [
    "~/.ush",
    "~/.ushrc",
  ]
end
