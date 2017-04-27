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

module Build
	module URI
		class Triplet < Struct.new(:userinfo, :host, :path)
			include Base
			
			PARSER = %r{\A
				(?:(?<userinfo>.+)@)?
				(?<host>[\w.-]+)
				:(?<path>.*)
			\z}x.freeze
			
			def local?
				false
			end
			
			def to_s
				buffer = String.new
				
				if userinfo
					buffer << userinfo << '@'
				end
				
				buffer << host << ':' << path
				
				return buffer
			end
			
			def self.parse(string)
				if match = PARSER.match(string)
					self.new(*match.values_at(*self.members))
				end
			end
		end
	end
end