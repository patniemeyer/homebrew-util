class OrchidCli < Formula
  desc "Simple, idiomatic RPCs for Java, Javascript, Android, iOS, and more"
  homepage "https://github.com/orchidtechnologies/orchid"
  url "https://github.com/patniemeyer/homebrew-util/raw/master/archives/orchid-cli-1.0.0.zip"
  sha256 "a15efc3864ed8132a7744371a57687f080d9db12ae7227d7def056a91af533c7"
  version "1.0.0"
  bottle :unneeded

  def install
    inreplace "orchid-cli.sh", "##PREFIX##", "#{prefix}"
    prefix.install "orchid"
    bin.install "orchid-cli.sh"
    bin.install_symlink "orchid-cli.sh" => "orchid"
  end
end
