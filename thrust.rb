class Thrust < Formula
  desc "A parallel algorithms library which resembles the C++ Standard Template Library (STL)"
  homepage "https://thrust.github.io/"
  url "https://github.com/thrust/thrust/releases/download/1.8.2/thrust-1.8.2.zip"
  version "1.8.2"
  sha256 "00925daee4d9505b7f33d0ed42ab0de0f9c68c4ffbe2a41e6d04452cdee77b2d"
  head "https://github.com/thrust/thrust.git"

  def install
    (include/"thrust").install Dir["*"]
  end
end
