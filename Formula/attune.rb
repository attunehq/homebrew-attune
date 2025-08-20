class Attune < Formula
  desc "Fast drop-in replacement build tool"
  homepage "https://github.com/attunehq/attune"
  url "https://github.com/attunehq/attune/releases/download/v0.2.0/attune-v0.2.0_macOS-arm64"
  sha256 "64df861b3405c9c490b4e9cb3136ba0ede4b8cb366fe888e05a87169a4951192"
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
