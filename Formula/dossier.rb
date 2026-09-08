class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossier"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.2.0/dossier-darwin-arm64"
      sha256 "8dafa208c12b2f8648be1019a239ce9b51dc75ea64dc64718dfc3023e9bd8fda"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.2.0/dossier-darwin-amd64"
      sha256 "5383e8d57a7cd479d071b3164eab55b47116341e0c91503ca936b886d7a67f0d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.2.0/dossier-linux-arm64"
      sha256 "1a83caa20b437b46678e8f2f2f51c788f91a232d703bad3a3f5473c299fd844e"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.2.0/dossier-linux-amd64"
      sha256 "2efef8081f20d129267f0bf61a84de22e25bc631826af03247f12b6af8370f0d"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
