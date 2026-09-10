class HarnessAssetManager < Formula
  desc "Local app and browser UI for universal skill management across agent harnesses"
  homepage "https://github.com/execsumo/harness-asset-manager"
  license "MIT"
  version "0.5.5"
  preserve_rpath

  on_arm do
    url "https://github.com/execsumo/harness-asset-manager/releases/download/v0.5.5/harness-asset-manager-v0.5.5-darwin-arm64.tar.gz"
    sha256 "d9ece53abd20a31d0c24cf5f0a8a0fbb61b35b395cc14cfdc028e8c2c2885667"
  end

  on_intel do
    url "https://github.com/execsumo/harness-asset-manager/releases/download/v0.5.5/harness-asset-manager-v0.5.5-darwin-x64.tar.gz"
    sha256 "8fa1060443cd4c98282c6f39b6923a73ff31e48d1c6c89d41653ae62766f7c74"
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
    assert_match "0.5.5", output
  end
end
