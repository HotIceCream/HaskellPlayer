{-# LANGUAGE TemplateHaskell #-}


module Lib
    (
    otherFunc
    ) where

import Control.Monad (unless)
import Graphics.UI.Gtk
import Data.FileEmbed
import Data.String
import System.Glib.UTFString

otherFunc :: IO ()
otherFunc = do
    let gui = $(embedStringFile "src/resources/player.glade") :: String
    initGUI
    -- Create the builder, and load the UI file
    builder <- builderNew
    builderAddFromString builder gui

    -- Retrieve some objects from the UI
    window <- builderGetObject builder castToWindow "window1"
    button <- builderGetObject builder castToButton "button_play"

    -- Basic user interation
    on button buttonActivated (putStrLn "button pressed!")
    on window objectDestroy mainQuit

    -- Display the window
    widgetShowAll window
    mainGUI