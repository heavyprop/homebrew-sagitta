class Sagitta < Formula
  desc "Small interpreted programming language written in C++17"
  homepage "https://github.com/heavyprop/sagitta"
  url "https://github.com/heavyprop/sagitta/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6304e6292340b3a0c49024463c4273b233ceeaa0570a015480e545004ca8bdaa"

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
