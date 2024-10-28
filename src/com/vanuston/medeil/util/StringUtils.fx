 package com.vanuston.medeil.util;

import javafx.scene.control.TextBox;

public function  charLimit(t:TextBox,limit:Integer):Boolean
    {
     if(t.rawText.trim().length()<=limit){
		return true;
     }
     else{
        t.deletePreviousChar();
        return false;
      }
   }
