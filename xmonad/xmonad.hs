import XMonad
import XMonad.Util.SpawnOnce

main = xmonad def
  { terminal = "alacritty"
  , modMask = mod4Mask
  , borderWidth = 3
  , normalBorderColor = "darkgray"
  , focusedBorderColor = "white"
  , focusFollowsMouse = False
  , startupHook = startup
  , layoutHook = myLayout
  }


startup :: X ()
startup = do
  spawnOnce "alacritty"


myLayout = Full ||| tiled ||| Mirror tiled
  where tiled = Tall 1 (3/100) (1/2)
