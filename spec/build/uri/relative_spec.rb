# Copyright, 2017, by Samuel G. D. Williams. <http://www.codeotaku.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

RSpec.describe Build::URI::Relative do
	describe "two relative paths" do
		subject {Build::URI.parse("a/b/") + Build::URI.parse("c/d")}
		
		shared_examples "valid relative"
		
		it "should concatenate paths" do
			is_expected.to be == Build::URI.parse("a/b/c/d")
		end
	end
	
	describe "two absolute paths" do
		subject {Build::URI.parse("/a/b/") + Build::URI.parse("/c/d")}
		
		shared_examples "valid relative"
		
		it "should be other absolute path when concatenated" do
			is_expected.to be == Build::URI.parse("/c/d")
		end
	end
	
	describe "absolute uri and relative path" do
		subject {Build::URI.parse("http://localhost/a/b/") + Build::URI.parse("c/d")}
		
		shared_examples "valid absolute"
		
		it "should concatenate paths" do
			is_expected.to be == Build::URI.parse("http://localhost/a/b/c/d")
		end
	end
	
	describe "absolute uri and absolute path" do
		subject {Build::URI.parse("http://localhost/a/b/") + Build::URI.parse("/c/d")}
		
		shared_examples "valid absolute"
		
		it "should be other absolute path when concatenated" do
			is_expected.to be == Build::URI.parse("http://localhost/c/d")
		end
	end
end
