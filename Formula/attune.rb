class Attune < Formula
  desc "Fast drop-in replacement build tool"
  homepage "https://github.com/attunehq/attune"
  url "https://github.com/attunehq/attune/releases/download/v0.2.2/attune-v0.2.2_macOS-arm64"
  version "0.2.2"
  sha256 "d0a4629e4c99d1bc760aa3bb341e54145d65a89b4968a5bd954367e2c60d6a8a"
  license "Apache-2.0"

  depends_on "gpgme"

  def install
    # Check for macOS arm64
    if !OS.mac? || !Hardware::CPU.arm?
      odie "Attune CLI is currently only available via Homebrew for macOS ARM64 (Apple Silicon)"
    end

    bin.install "attune-v#{version}_macOS-arm64" => "attune"
  end

  test do
    assert_match "Attune CLI", shell_output("#{bin}/attune --help")
    assert_match version.to_s, shell_output("#{bin}/attune --version")
  end
end
