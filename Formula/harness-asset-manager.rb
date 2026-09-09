class HarnessAssetManager < Formula
  desc "Local app and browser UI for universal skill management across agent harnesses"
  homepage "https://github.com/execsumo/harness-asset-manager"
  license "MIT"
  version "0.5.3"
  preserve_rpath

  on_arm do
    url "https://github.com/execsumo/harness-asset-manager/releases/download/v0.5.3/harness-asset-manager-v0.5.3-darwin-arm64.tar.gz"
    sha256 "a28684f880862e70c3378ba9417c6459990852e1a1a17c8f37f894f755d6ad7d"
  end

  on_intel do
    url "https://github.com/execsumo/harness-asset-manager/releases/download/v0.5.3/harness-asset-manager-v0.5.3-darwin-x64.tar.gz"
    sha256 "93d513d9e9a428af1288f4ad9c2a05525f767771268c3d1b14de978861947480"
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
    assert_match "0.5.3", output
  end
end
