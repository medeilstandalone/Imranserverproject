/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.ui;

import javafx.scene.control.TextBox;
import java.lang.Exception;
import com.vanuston.medeil.util.Logger;

/**
 * @author saran
 */
public class KeyController {
    var log:Logger =Logger.getLogger(KeyController.class,"KeyController");
    public function isValid(t: TextBox, len: Integer): Boolean {
        try {
            var str: String = t.rawText;
            if (str.length() <= len) {
                return true;
            } else {
                t.deletePreviousChar();
                return false;
            }

        } catch (e:Exception) {
            log.debug("Error Occured Is Valid  {e.getMessage()}");
            t.deletePreviousChar();
            return false;
        }
    }

}
