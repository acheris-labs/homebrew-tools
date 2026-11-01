# Cask template for acheris-labs/homebrew-tools (Casks/ush.rb).
# Rendered by the release workflow with envsubst: VERSION and SHA_ZIP come from
# the release's notarized zip, which holds the ush binary and nothing else.
cask "ush" do
  version "0.1.1"
  sha256 "2e852a760d0c9b247b336e4aa8ff360cd448f7bdddb2dcce7b53bc6d644c1942"

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
