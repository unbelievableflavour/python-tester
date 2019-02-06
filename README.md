# Python Tester
Test your Python code easily

<p align="center">
    <a href="<p align="center">
    <a href="https://appcenter.elementary.io/com.github.bartzaalberg.python-tester">
        <img src="https://appcenter.elementary.io/badge.svg" alt="Get it on AppCenter">
    </a>
</p>

<p align="center">
    <img
    src="https://raw.githubusercontent.com/bartzaalberg/python-tester/master/screenshot.png" />
</p>

### Python code without a server!

A Vala application to test Python snippets without the hassle.

## Installation

First you will need to install elementary SDK

 `sudo apt install elementary-sdk`

### Dependencies

These dependencies must be present before building
 - `valac`
 - `gtk+-3.0`
 - `granite`
 - `gtksourceview-3.0`

 You can install these on a Ubuntu-based system by executing this command:

 `sudo apt install valac libgtk-3-dev libgranite-dev gtksourceview-3.0`

### Building
```
meson build --prefix=/usr
cd build
ninja
```

### Installing
`sudo ninja install`

### Recompile the schema after installation
`sudo glib-compile-schemas /usr/share/glib-2.0/schemas`
