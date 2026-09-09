class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossier"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.2.2/dossier-darwin-arm64"
      sha256 "c1b951f95912c55a8d1a90738c26e7dc6cc89dc0b43891818771f5bca7d5483c"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.2.2/dossier-darwin-amd64"
      sha256 "f3aed2f09fe6fa3c35b23763a49cb3bfb55694e1beaebdefe499471ea34c3220"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.2.2/dossier-linux-arm64"
      sha256 "c629363b427460d6c09278024c406738830e7e29053d8f382c62cc014228cefc"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.2.2/dossier-linux-amd64"
      sha256 "3f3907739030a3620f013b7572b0ff099bb1762b985ff6d81aa167062226ac0a"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
