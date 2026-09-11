class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossier"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.2.4/dossier-darwin-arm64"
      sha256 "c75bf8943914b65cddb3328906a25ebd16497b64c941e3b06bffb8ce5fa4b5a0"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.2.4/dossier-darwin-amd64"
      sha256 "e49b8c2537a2d26a67efe73f26caa337edf88ff5a260672be708225c1bec68b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.2.4/dossier-linux-arm64"
      sha256 "7a734a2a3902c5281626619a2ad3c49245fe4b992e1bbfff49f32a7805386296"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.2.4/dossier-linux-amd64"
      sha256 "4af479c07f73306c81307c374a84b10f1bf65436c982728bebdb4ad4ba64f3cc"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
