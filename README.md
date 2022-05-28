# game-saves-linker
Game saves linker for galgames (and other games).

## What does it do?

Just as the repo name implies, it will link you games' saves to your custom location (instead of some random default path).

Some games store their saves in a default path (and you cannot change it). But, who wants their precious saves stored in C: drive where you cannot even find them. If you forgot to back them up and did a fresh install of Windows, and now you are SCREWED!

Using directory symbolic links, this script solves this problem by making the game believe that it is saving to the default path, but instead, the saves are written to you custom location (currently in `SAVES` folder that is along side this script; will allow custom locations if there is a need).

## How to use it?

This script will link your games' default saves directory to `.\SAVES` (alongside where you put these scripts).

Typically, you will put these scripts within your games' installation directory, so that all saves are also alongside your game. So you can easily find and backup them.

1. Copy these three files `0LINKSAVES.CMD`, `1UNLINKSAVES.CMD`, and `2SAVEPATH.CMD` to your games' installation directory.

2. Open and edit `2SAVEPATH.CMD`. You need to specify the default location of your saves, otherwise I have no idea where to link your saves to. See the example for Riddle Joker inside this file.

   ```batch
   REM Echo the default save path of the game like this,
   REM **without** the backslash at the end,
   REM which will be linked to .\SAVES
   REM You can use environment variables to make this more dynamic (just like the example below).
   ECHO %USERPROFILE%\AppData\Roaming\YuzuSoft\RiddleJoker
   ```

3. IMPORTANT: back up your current saves before doing this step!

   Done! Double click `0LINKSAVES.CMD` (possibly with administrator privileges) to link `.\SAVES` to the default location of your game.

4. Move your saves that you just backed up to `.\SAVES`. Now your saves are in their new locations, and your game will work as before.

Effect:

In the example above, your saves are originally stored in `%USERPROFILE%\AppData\Roaming\YuzuSoft\RiddleJoker`. Now it is in `.\SAVES` (where you put this script).

When the game tries to access `%USERPROFILE%\AppData\Roaming\YuzuSoft\RiddleJoker`, it is actually accessing `.\SAVES`. So even if you moved your saves, your game will continue to work.

## FAQ

1. Q: Why there is 0, 1, 2 in the file name?

   A: This is intentionally added to make sure it is on top so that you can easily find it, otherwise you need to scan through a lot of files (especially in a games' installation directory where there are a TON of files).

2. Q: Can it support custom save paths instead of `.\SAVES`?

   A: Currently no, but it is easy to support this feature. You can implement it yourself, or I will add this feature at a later time.
