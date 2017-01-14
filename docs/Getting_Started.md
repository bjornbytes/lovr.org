<!--
category: guide
-->

Getting Started
===

This guide will help you install LÖVR and teach you how to create a simple scene.  You'll need to
have an HTC Vive or Oculus Rift handy, and you'll also need to have SteamVR installed on your
computer.

Installing LÖVR
---

First, download LÖVR from the website or just click [here](http://bjornbyt.es/f/lovr.zip).

<img>

Next, extract the zip file and open up the folder.  You should see a file called `lovr.exe` and a
bunch of `.dll` files.

<img>

Double click on the `lovr.exe` file to open LÖVR.  If you see a window with a black screen, don't
panic!  That means LÖVR is working!  If you don't tell LÖVR what project you want to run, it will
just open a blank window.  That's super boring though.  Let's create a project with a cube in it.

To create a project, just create a new folder somewhere.  You can call the folder whatever you want.
I'm going to call it `SuperEpicCube`.

<img>

Writing Code
---

Now we're going to have to write some code.  Code is really scary, so we're going to download a
**text editor** to make it easier for us to write code.  There are lots of different kinds of text
editors.  Some good ones are [Sublime Text](http://www.sublimetext.com), [Atom](http://atom.io), or
[Zero Brane Studio](https://studio.zerobrane.com).  I'll use Sublime Text for this tutorial, but
the approach should be similar no matter what text editor you use.

Every LÖVR project needs a special file called `main.lua`.  Open a new file in your text editor and
type out this Lua code.  If you don't know what Lua is or don't know what the code does or are
beginning to have an out of body experience, that's fine.  It's not important to understand all the
details of the code right now.  *However*, I recommend that you avoid just copying and pasting it!
Typing out each line does this magical thing to your brain that helps you read, write, and
understand the code better.  I promise.

```
function lovr.draw()
  lovr.graphics.cube('line', 0, 1, 0)
end
```

Whew, that wasn't so bad.  Okay, save the file inside the `SuperEpicCube` folder and be sure to
name it `main.lua`.  Now we're ready to run our project!

Running a Project
---

We're going to run our project with LÖVR and experience our cube in VR.  First, start SteamVR if it
isn't started already:

<img>

Now, drag the `SuperEpicCube` folder on to the `lovr.exe` application we ran earlier:

<img>

Ok, put on your headset!  You should see a cube floating in the middle of the play space.  Walk
around, introduce yourself to it, befriend it.  That's it for this guide.  I knew you could do it.
If you want to make something even more cool, you'll need to learn a little bit more about Lua.
Continue on to the [Lua Primer]() guide to learn more about Lua!
