Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "AssistScreenShareKit"
  s.version      = "0.1.73"
  s.summary      = "A screen sharing framework for Zoho Assist"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.homepage = "https://assist.zoho.com"
  s.description  = "A screen sharing framework for Zoho Assist"
  s.license      = { :type => "MIT", :text=> <<-LICENSE
  MIT License

  Copyright (c) 2017 Zoho

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in allcd 
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE
  LICENSE
}
  s.author       = { "Kishore Kumar" => "kishorekumar.n@zohocorp.com" }
  # s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.source           = { :http => "https://www.dropbox.com/s/y3vp0aprfhqanio/AssistScreenShareKit.framework.zip?dl=1" }

  s.frameworks = 'UIKit','Foundation', 'CoreMedia'
  s.social_media_url = "http://zoho.com"
  # s.source_files = 'AssistScreenShareKit.framework/Headers/*.{h,m,swift}'
  s.ios.vendored_frameworks = 'AssistScreenShareKit.framework'
  # s.public_header_files = "AssistScreenShareKit.framework/Headers/*.h"
  s.module_map = 'AssistScreenShareKit.framework/Modules/module.modulemap'
  s.module_name  = 'AssistScreenShareKit'
end

# https://download-accl.zoho.com/v1/docs/download/a8lsu31315b6ed5964481a013b9d236098077

#https://docs.zoho.com/docs/orig/a8lsu31315b6ed5964481a013b9d236098077

#https://www.zoho.com/salesiq/downloads/plugins/Mobilisten.zip

#https://dl.google.com/dl/cpdc/af2365f0e660f9e3/GoogleWebRTC-1.1.19878.tar.gz
