<!--
category: module
-->

lovr.filesystem
===

The `lovr.filesystem` module provides a way to access the filesystem.  In LÖVR, the game is only
able to write to a single directory, called the save directory.  The location of the save directory
is platform-specific:

- Windows: `C:\Users\<user>\AppData\Roaming\LOVR\<identity>`
- macOS: `/Users/<user>/Library/Application Support/LOVR/<identity>`
- Linux: `/home/<user>/.config/LOVR`

You can use `lovr.conf` or `lovr.filesystem.setIdentity` to give your game a unique `identity`.

All filenames are relative to either the save directory or the directory containing the game's
source.  If a file exists in both the save directory and the game source, the file in the save
directory takes precedence.

<table>
<tr>
  <td class="pre">lovr.filesystem.append</td>
  <td>Append content to the end of a file.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.createDirectory</td>
  <td>Create a directory.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.exists</td>
  <td>Check whether a file exists.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.getAppdataDirectory</td>
  <td>Get the system "application data" directory.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.getDirectoryItems</td>
  <td>Get a list of files and folders in a directory.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.getExecutablePath</td>
  <td>Get the path of the LÖVR executable.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.getLastModified</td>
  <td>Get the last time a file was modified.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.getIdentity</td>
  <td>Get the name of the save directory.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.getRealDirectory</td>
  <td>Get the real folder containing a file in the virtual filesystem.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.getSaveDirectory</td>
  <td>Get the directory where files will be written.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.getSize</td>
  <td>Get the size of a file in bytes.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.getSource</td>
  <td>Get the location of the game's source.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.getUserDirectory</td>
  <td>Get the location of the user's home directory.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.isDirectory</td>
  <td>Check whether a path is a directory.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.isFile</td>
  <td>Check whether a path is a file.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.isFused</td>
  <td>Check whether the game is being run as a standalone executable.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.load</td>
  <td>Load a file containing Lua code.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.mount</td>
  <td>Mount a folder or archive into the virtual filesystem.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.read</td>
  <td>Read the contents of a file.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.remove</td>
  <td>Remove a file or directory.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.setIdentity</td>
  <td>Set the name of the save directory.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.unmount</td>
  <td>Unmount an archive previously mounted with lovr.filesystem.mount.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.write</td>
  <td>Write to a file.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.newBlob</td>
  <td>Create a Blob.</td>
</tr>
</table>
