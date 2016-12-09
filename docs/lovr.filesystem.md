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

It is recommended to use `lovr.conf` or `lovr.filesystem.setIdentity` to give your game a unique
`identity`.

All filenames are relative to either the save directory or the directory containing the game's
source.  If a file exists in both the save directory and the game source, the file in the save
directory takes precedence.

<table>
<tr>
  <td class="pre">lovr.filesystem.append</td>
  <td>Append content to the end of a file.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.exists</td>
  <td>Check whether a file exists.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.getExecutablePath</td>
  <td>Get the path of the LÖVR executable.</td>
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
  <td class="pre">lovr.filesystem.read</td>
  <td>Read the contents of a file.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.setIdentity</td>
  <td>Set the name of the save directory.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.setSource</td>
  <td>Set the source of the game.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem.write</td>
  <td>Write to a file.</td>
</tr>
</table>
