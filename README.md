<p align="left">
<img src="https://github.com/kreatolinux/logo/blob/master/core.png"  height="10%" width="10%"> 
</p>

# Cake
The cake is a lie.

A simple build tool (Like make) that uses a very simple ini format.

This tool is made so Kreato's Userland doesnt have to rely on third-party build tools, such as make and ninja.

# Goals
* Very simple configuration
* Speed

# Usage
If you never had cake, bootstrap it by running `nim c -o cake src/cake.nim`. Then you can build and install it by running `./cake install` as root.

# Syntax
Syntax is heavily inspired by systemd services.

A simple (but functional!) cakefile is used in this repository. You can check it to see how it would look.

# License
This project is a part of Kreato Linux.

cake is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

cake is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with Kreato Linux.  If not, see <https://www.gnu.org/licenses/>.
