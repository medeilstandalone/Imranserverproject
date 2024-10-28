package com.vanuston.medeil.util;

import javafx.scene.control.TextBox;

public function  isNumeric(t:TextBox):Boolean
    {
      try
       {
        Double.parseDouble(t.rawText);
        return true;
       }
     catch(Exception )
      {
          t.deletePreviousChar();
        return false;
      }
   }