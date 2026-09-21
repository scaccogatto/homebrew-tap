class Nastro < Formula
  desc "Terminal-native call recorder for macOS: no bots, no cloud"
  homepage "https://github.com/scaccogatto/nastro"
  url "https://github.com/scaccogatto/nastro/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "b6a60d1be020720662011f274de1d242068937914c6f732c0038aaccc9f675dd"
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
