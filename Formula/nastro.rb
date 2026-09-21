class Nastro < Formula
  desc "Terminal-native call recorder for macOS: no bots, no cloud"
  homepage "https://github.com/scaccogatto/nastro"
  url "https://github.com/scaccogatto/nastro/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "1d77d721a0e1b25ae37cef73414f53b08bc0c1f12870980872f05360b77e822c"
  license "MIT"
  head "https://github.com/scaccogatto/nastro.git", branch: "main"

  depends_on "go" => :build
  depends_on macos: :sonoma # CoreAudio process tap needs 14.4+
  depends_on xcode: :build  # swiftc for nastro-tap

  def install
    system "make", "build", "check-tap"
    bin.install "bin/nastro", "bin/nastro-tap"
  end

  def caveats
    <<~EOS
      On first recording, macOS will ask your terminal app for
      Screen & System Audio Recording permission.

      Transcription runs locally via whisper.cpp - nastro offers to
      install it on first use. Want speaker-diarized transcripts?
      Set transcriber = "whisperx" in ~/.config/nastro/config.toml
      (needs a HuggingFace token - nastro guides you through it).
    EOS
  end

  test do
    assert_match "usage", shell_output("#{bin}/nastro badcommand 2>&1", 1)
  end
end
