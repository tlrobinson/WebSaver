WebSaver: A WebKit-based Mac OS X screensaver
=============================================

A Mac OS X screensaver which simply embeds WebKit to display a webpage or JavaScript application. Perfect for Canvas animations.

You can specify a web url as screen saver.

This version includes a simple Preferences sheet.

Instructions
------------

Install the pre-built version of WebSaver by double-clicking "WebSaver/build/Release/Web.saver".

Replace "Web.saver/Contents/Resources/index.html" with your own web page or application.

To build from source, do the following:

1. Open WebSaver.xcodeproj in Xcode.

2. Build.

3. Double-click the built Web.saver to install.

Notes
-----

* Change the "Product Name" in the "Web" target if you are distributing a screensaver to prevent conflicts with others.

License
-------

Copyright (c) 2013, Thomas Robinson <http://tlrobinson.net/>

Copyright (c) 2012, Senseg Ltd <http://www.senseg.com>

All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Thomas Robinson, Senseg nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY Thomas Robinson AND/OR Senseg ''AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Thomas Robinson BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
