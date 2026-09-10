class HarnessAssetManager < Formula
  desc "Local app and browser UI for universal skill management across agent harnesses"
  homepage "https://github.com/execsumo/harness-asset-manager"
  license "MIT"
  version "0.5.4"
  preserve_rpath

  on_arm do
    url "https://github.com/execsumo/harness-asset-manager/releases/download/v0.5.4/harness-asset-manager-v0.5.4-darwin-arm64.tar.gz"
    sha256 "e8962485711d5c15ed77b259d9a12502724d4d3d7a6b13a8948c54e57ed2af39"
  end

  on_intel do
    url "https://github.com/execsumo/harness-asset-manager/releases/download/v0.5.4/harness-asset-manager-v0.5.4-darwin-x64.tar.gz"
    sha256 "8181d6763901d286a65a4a44af050170a008eba95f2c6ef6f324184f2b3608da"
  end

  def install
    staged_root = (buildpath/"harness-asset-manager").directory? ? buildpath/"harness-asset-manager" : buildpath
    libexec.install staged_root.children
    bin.install_symlink libexec/"harness-asset-manager" => "harnessam"
  end

  def caveats
    <<~EOS
      If `harnessam: command not found`, Homebrew's bin directory isn't on your PATH yet:
        eval "$(brew shellenv)"
      Add that line to your shell profile (~/.zprofile or ~/.bash_profile) to make it permanent.
    EOS
  end

  test do
    output = shell_output("#{bin}/harnessam --version")
    assert_match "0.5.4", output
  end
end
