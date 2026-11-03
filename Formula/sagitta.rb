class Sagitta < Formula
  desc "Small interpreted programming language written in C++17"
  homepage "https://github.com/heavyprop/sagitta"
  url "https://github.com/heavyprop/sagitta/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"

  def install
    # build with the Makefile, using Homebrew's C++ compiler
    system "make", "CXX=#{ENV.cxx}"
    bin.install "sagitta"
  end

  # brew test sagitta runs this
  test do
    (testpath/"hello.sgt").write("print(1 + 2);\n")
    assert_equal "3", shell_output("#{bin}/sagitta hello.sgt").strip
  end
end
