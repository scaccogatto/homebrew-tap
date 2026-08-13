class Nastro < Formula
  desc "Terminal-native call recorder for macOS: no bots, no cloud"
  homepage "https://github.com/scaccogatto/nastro"
  url "https://github.com/scaccogatto/nastro/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "a49933f477f0f8dd2746e899db726ae4abff5e5cddbad90fe6d3101c775fe000"
  license "MIT"
  head "https://github.com/scaccogatto/nastro.git", branch: "main"

  depends_on "go" => :build
  depends_on macos: :sonoma # CoreAudio process tap needs 14.4+
  depends_on xcode: :build  # swiftc for nastro-tap

  def install
    system "make", "build"
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
