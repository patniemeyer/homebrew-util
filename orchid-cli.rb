class PresentRpc < Formula
  desc "Simple, idiomatic RPCs for Java, Javascript, Android, iOS, and more"
  homepage "https://github.com/orchidtechnologies/orchid"
  #url "https://github.com/orchidtechnologies/util/raw/master/..."
  url "https://github.com/patniemeyer/util/archives/orchid-cli-1.0.0.zip"
  sha256 "9e1344e8c75eabe23655519263162d2bc7d774b34cde1bda01352983990af537"
  version "1.0.0"
  bottle :unneeded

  def install
    inreplace "orchid-cli.sh", "##PREFIX##", "#{prefix}"
    prefix.install "orchid"
    bin.install "orchid-cli.sh"
    bin.install_symlink "orchid-cli.sh" => "orchid"
  end

end
