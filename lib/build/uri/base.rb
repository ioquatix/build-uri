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
		SEPARATOR = '/'.freeze
		
		module Base
			# @attr directory [Boolean] If true, we consider every path to represent a directory, even if there is no trailing slash. If false, basename of self will be ignored when joining.
			def merge(other, directory: true)
				if self.path.nil? || other.absolute?
					return other
				else
					clone = self.dup
					
					if other.path.start_with?(SEPARATOR)
						clone.path = other.path
					elsif directory
						# We try to avoid ending up with more than one slash:
						if self.path.end_with?(SEPARATOR)
							clone.path = [self.path, other.path].join
						else
							clone.path = [self.path, other.path].join(SEPARATOR)
						end
					else
						# The basename of a non-directory path is ignored when merged.
						dirname, _, basename = self.path.rpartition(SEPARATOR)
						
						clone.path = [dirname, other.path].join(SEPARATOR)
					end
					
					return clone.freeze
				end
			end
			
			def + other
				merge(URI[other])
			end
			
			def dirname
				clone = self.dup
				
				clone.path = self.path.rpartition(SEPARATOR).first
				
				return clone
			end
			
			def basename
				clone.path = self.path.rpartition(SEPARATOR).last
			end
		end
	end
end
