class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossier"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.2.3/dossier-darwin-arm64"
      sha256 "c7d925c443288622257a4fbc84d471f8c2d6ece560789a73b5e83e85ef78843b"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.2.3/dossier-darwin-amd64"
      sha256 "cfff0a17200e569ce94d6076baab143e436744bfe44daa92c4f670053a766bc5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.2.3/dossier-linux-arm64"
      sha256 "3adfc3048106a7d8fa9d905c1d8c13250382ef35c042c0b34d196f251e2854fe"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.2.3/dossier-linux-amd64"
      sha256 "19425d283ce97ab0c2da75923ca0e87fe07e6d84a2cc6704de82c12636c416a3"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
