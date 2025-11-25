class Attune < Formula
  desc "Fast drop-in replacement build tool"
  homepage "https://github.com/attunehq/attune"
  url "https://github.com/attunehq/attune/releases/download/v0.2.1/attune-v0.2.1_macOS-ARM64"
  version "0.2.1"
  sha256 "d2d4a7e11cdf502bac5e07e8ec7a6216859088d3f4911486568e37aee948c01f"
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
