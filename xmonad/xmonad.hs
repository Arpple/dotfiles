import XMonad

main = xmonad def
  { terminal = "alacritty"
  , modMask = mod4Mask
  , borderWidth = 3
  , normalBorderColor = "black"
  , focusedBorderColor = "white"
  }
