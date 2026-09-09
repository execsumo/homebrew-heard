class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossier"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.2.1/dossier-darwin-arm64"
      sha256 "428f51af9fc3d28ffca42c9e11ce8961ae2daf9c0fb64ca6e6972ee4a878632d"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.2.1/dossier-darwin-amd64"
      sha256 "fa20c97c8478e4e10f7e8043485cf89bf35708c039bdfa5dab5ee15f22f51276"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.2.1/dossier-linux-arm64"
      sha256 "6aad3fc15c05f563c7aa4199e7420bbc6422029c0de3b79240b00e8d6855c446"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.2.1/dossier-linux-amd64"
      sha256 "787e23f3ca65717c124a8b5b31364844894febbd7501b3d68efb1427f88d3e4e"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
