class Sagitta < Formula
  desc "Small interpreted programming language written in C++17"
  homepage "https://github.com/heavyprop/sagitta"
  url "https://github.com/heavyprop/sagitta/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "612ad430bbace4213945c3da36f50f25364e37f980e31b0460df8f5c4d4e91f1"

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
