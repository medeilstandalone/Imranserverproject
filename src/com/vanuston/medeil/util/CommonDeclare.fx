package com.vanuston.medeil.util;

import javafx.scene.input.KeyEvent;
import javafx.scene.input.KeyCode;
import javafx.animation.Timeline;
import javafx.animation.Interpolator;
import com.vanuston.medeil.util.KeyRegistry;

def KyRegistry = KeyRegistry {};
public var user: String = "DefaultUser";
public var userType: String;
public var tin: String;
public var ScreenWidth: Number;
public var ScreenHeight: Number;
public var MainPageForm: String;

public var marqContent : String;
public var marqRun : Boolean;
public var ThemeType: String = "MedilStyle";

//Free Edition Limit
public var freeLimit : Integer = 500;

public var form: Integer[] = [0, 0, 0, 0, 0, 0, 0] on replace {
    currKyEvent = null;
    temp = form[currModule - 1];
}
public var currKyEvent: KeyEvent on replace {
    if (currKyEvent.controlDown or currKyEvent.altDown or currKyEvent.shiftDown) {
        KyRegistry.actionKey = currKyEvent.code;
    }
}
public var currModule: Integer = 0 on replace {
    currKyEvent = null;
}
public var currRep: String = "";
public var temp: Integer = 0;
public var DockWidth: Number on replace {
    DockW = DockWidth;
    if (DockWidth == 8) {
        fadeForm.rate = -1.0;
        fadeForm.play();
    } else if (DockWidth == 237) {
        fadeForm.rate = 1.0;
        fadeForm.play();
    }
}
public var DockW: Number;
var fadeForm = Timeline {
            keyFrames: [
                at (0s) {DockW => 8.0 tween Interpolator.LINEAR},
                at (0.05s) {DockW => 237.0 tween Interpolator.LINEAR},
            ] };
public var panelFormW = bind (ScreenWidth - DockW);
public var panelFormH = bind (ScreenHeight - 192);
public var panelMsgBoxLX = bind (ScreenWidth - 500) / 2;
public var panelMsgBoxLY = bind (ScreenHeight - 200) / 2;
public var Type1TextboxW = bind (25.4129 * panelFormW) / 100;
public var Type2TextboxW = bind (19.0597 * panelFormW) / 100;
public var Type3TextboxW = bind (12.7064803 * panelFormW) / 100;
public var Type4TextboxW = bind (6.3532 * panelFormW) / 100;
public var AmountTextboxW = bind (31.76620076 * panelFormW) / 100;
public var imgLogoLX = bind ScreenWidth - 280.0;
public var imgLogoLY = 80.0;
//Etown Logo configurations
/*public var imgEtownLogoLX = bind ( (68.0/100.0) * ScreenWidth ) ;
public var imgEtownLogoLY = bind ( (40.0/100) * (ScreenHeight))  ;
public var imgEtownVanLogoLX = bind ( (5.0/100.0) * ScreenWidth );
public var imgEtownVanLogoLY = bind ( (89.0/100) * (ScreenHeight))  ;*/

public var imgLogoW = 140.0;
public var imgLogoH = 36.0;
public var Column1LX = bind (6.3532 * panelFormW) / 100;
public var Column2LX = bind (19.0597 * panelFormW) / 100;
public var Column3LX = bind (54.3837 * panelFormW) / 100;
public var Column4LX = bind (65.4383 * panelFormW) / 100;
public var Column21LX = bind (19.31385006 * panelFormW) / 100;
public var Column22LX = bind (33.03684879 * panelFormW) / 100;
public var BottomC1LX = bind Column1LX - 30;
public var BottomC2LX = bind BottomC1LX + 70;
public var BottomC3LX = bind BottomC2LX + Type4TextboxW + 55;
public var BottomC4LX = bind BottomC3LX + 80;
public var botton1LX = bind (10.29224905 * panelFormW) / 100;
public var botton2LX = bind (30.62261753 * panelFormW) / 100;
public var botton3LX = bind (50.95298602 * panelFormW) / 100;
public var botton4LX = bind (71.28335451 * panelFormW) / 100;
public var botton43LX = bind (80.28335451 * panelFormW) / 100;
public var botton31LX = bind (22.04574333 * panelFormW) / 100;
public var botton32LX = bind (41.7407878 * panelFormW) / 100;
public var botton33LX = bind (61.43583227 * panelFormW) / 100;
public var botton41LX = bind (36.21346887 * panelFormW) / 100;
public var botton42LX = bind (51.58831004 * panelFormW) / 100;
public var bottonW = 140.0;
public var bottonH = 40.0;
public var bottonImageW = 28.0;
public var bottonImageH = 26.0;
public var panelButtonsLY = bind (89.908 * panelFormH) / 100;
public var rectbutton1LX = bind rectbutton2LX-140.0;
public var rectbutton2LX = bind ((panelFormW+((95.29860229 * panelFormW) / 100))/2)-120.0;
public var rectbuttonLY = bind (85.52110092 * panelFormH) / 100;
public var seperatorW = bind (93.0143 * panelFormW) / 100;
public var botton51LX = bind (2.350698856 * panelFormW) / 100;
public var botton52LX = bind (22.04574333 * panelFormW) / 100;
public var botton53LX = bind (41.7407878 * panelFormW) / 100;
public var botton54LX = bind (60.80050826 * panelFormW) / 100;
public var botton55LX = bind (79.86022872 * panelFormW) / 100;
public var one = bind (0.127064803 * panelFormW) / 100;
public var two = bind (0.254129606 * panelFormW) / 100;
public var five = bind (0.635324015 * panelFormW) / 100;
public var ten = bind (1.27064803 * panelFormW) / 100;
public var hundred = bind (12.7064803 * panelFormW) / 100;
public var twoHund = bind (25.41296061 * panelFormW) / 100;
public var panelFullScreenW = bind ScreenWidth - 4;
public var botton11LX = bind (28.515625 * panelFullScreenW) / 100;
public var botton12LX = bind (43.65234375 * panelFullScreenW) / 100;
public var botton13LX = bind (58.7890625 * panelFullScreenW) / 100;
public var botton21LX = bind (20.94726563 * panelFullScreenW) / 100;
public var botton22LX = bind (36.08398438 * panelFullScreenW) / 100;
public var botton23LX = bind (51.22070313 * panelFullScreenW) / 100;
public var botton24LX = bind (66.35742188 * panelFullScreenW) / 100;
public var Column11LX = bind (6.3532 * panelFullScreenW) / 100;
public var Column12LX = bind (19.0597 * panelFullScreenW) / 100;
public var Column13LX = bind (54.3837 * panelFullScreenW) / 100;
public var Column14LX = bind (65.4383 * panelFullScreenW) / 100;
public var seperatorFullScreenW = bind (93.0143 * panelFullScreenW) / 100;

public var salesDiscApply:Boolean=false;//Discount option amount/percentage

public function textbox_default(): String {
    "-fx-border-width:2; -fx-border-color:#696969; -fx-background-color:#ffffff;"
}
public function textbox_mandatory(): String {
    "-fx-border-width:2;"
    "-fx-border-color:#666666;"
    "-fx-background-color:#f1f5b3;";
}
public function presc_textbox_mandatory(): String {
    "-fx-border-width:2;"
    "-fx-border-color:#666666;"
    "-fx-background-color:#E1F8D0;";
}

public function textbox_error(): String { "-fx-border-width:2;"
    "-fx-border-color:#df0c0c;"
    "-fx-background-color:#f1cec2;";
}

public var repKey: KeyCode = KeyCode.VK_F10;

public var exit_msg="please wait for Few Minute Your files are Auto Backuped.....Are you sure you want to exit MEDEIL?";
public var exitForm_msg= "Are you sure you want to close current Form?";
public var edition_msg = "Sorry! This feature is not available in this Edition of MEDEIL. Please upgrade your Edition to get full access.";
public var access_deny_msg="Sorry! Access Denied :Current user does not have permission to open this module";