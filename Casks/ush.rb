# Cask template for acheris-labs/homebrew-tools (Casks/ush.rb).
# Rendered by the release workflow with envsubst: VERSION and SHA_ZIP come from
# the release's notarized zip, which holds the ush binary and nothing else.
cask "ush" do
  version "0.1.2"
  sha256 "96ec6baf2d844f13a95f80951da3ba5284608538e22288a5ad8664756679817f"

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
