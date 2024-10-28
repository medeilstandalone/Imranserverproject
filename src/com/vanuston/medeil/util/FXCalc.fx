package com.vanuston.medeil.util;

import javafx.scene.Node;
import javafx.scene.Group;
import javafx.scene.CustomNode;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import javafx.scene.text.TextOrigin;
import javafx.scene.shape.Rectangle;
import javafx.scene.paint.Color.*;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.input.MouseEvent;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.KeyCode;
import javafx.scene.paint.Color;

public class FXCalc extends CustomNode {

    var transY = 44.0;
    var border = 7.0;
    var selIndex = 0;
    public var width = Key.width * 4 + border * 2.0;
    public var height = Key.height * 5 + border * 2.0 + transY;
    def dispFill = LinearGradient {
                endX: 0.0
                endY: height
                proportional: false
                stops: [
                    Stop {
                        offset: 0
                        color: Color.WHITE
                    },
                    Stop {
                        offset: 0.2
                        color: web("#d1e78f");
                    }
                ]
            }
    def lineFill = LinearGradient {
                startX: 0.0,
                startY: 0.0,
                endX: 0.0,
                endY: height
                proportional: false
                stops: [
                    Stop {
                        offset: 0
                        color: Color.WHITE
                    },
                    Stop {
                        offset: 0.2
                        color: Color.GRAY
                    }
                ]
            }
    var numberBackground = Rectangle {
                x: 3 + border
                y: 3 + border
                width: width - border * 2.0
                height: 35
                fill: dispFill
                stroke: lineFill
                strokeWidth: 2.0
                arcWidth: 5
                arcHeight: 5
            };
    public var number: String = "0.00";
    var numberText: Text = Text {
                translateX: bind width - numberText.layoutBounds.width - 19
                translateY: 8 + border
                font: Font {
                    name: "Arial Bold"
                    size: 25
                }
                fill: Color.BLACK
                content: bind format(number);
                textOrigin: TextOrigin.TOP
            };
    var operation: String = "";
    var operationText: Text = Text {
                translateX: 8 + border
                translateY: 13 + border
                font: Font {
                    name: "monospaced"
                    size: 10
                }
                fill: Color.BLACK
                content: bind operation;
                textOrigin: TextOrigin.TOP
            };
    var memory: String = "";
    var memoryText: Text = Text {
                translateX: 8 + border
                translateY: 24 + border
                font: Font {
                    name: "monospaced"
                    size: 10
                }
                fill: Color.BLACK
                content: bind memory;
                textOrigin: TextOrigin.TOP
            };

    function format(num: String): String {

        var temp = "{num}";
        var dotIndex = temp.indexOf(".");

        if ((dotIndex != -1) and (temp.trim().length() > (dotIndex + 3))) {
            var eIndex = temp.indexOf("E");
            var eTemp = "";
            if (eIndex != -1) {
                eTemp = "{temp.substring(eIndex)}";
            }
            temp = "{temp.substring(0, (dotIndex + 3))}{eTemp}";
        } else if (temp == "0") {
            temp = "0.";
        }
        if (temp.trim().length() >= 12) { return "Error"; }
        return num;
    }

    var calcKeys: Key[];

    override function create(): Node {

        // Set Calculator Keyboard Layout
        var keyText = [
                    "M+", "M-", "M", "/",
                    "7", "8", "9", "X",
                    "4", "5", "6", "+",
                    "1", "2", "3", "-",
                    "0", ".", "C", "="
                ];
        var keyCode = [
                    10, 11, 12, 13,
                    7, 8, 9, 14,
                    4, 5, 6, 15,
                    1, 2, 3, 16,
                    0, 19, 18, 17
                ];

        for (row in [0..4]) {
            for (col in [0..3]) {
                insert Key {
                    x: ((Key.width + 1) * col) + border
                    y: ((Key.height + 1) * row) + border
                    content: keyText[(sizeof calcKeys)]
                    code: keyCode[(sizeof calcKeys)]
                    onMousePressed: function(e: MouseEvent) {
                        onMousePressed(e);
                    }
                    onKeyPressed: function(e: KeyEvent) {
                        KeyPressed(e);
                    }
                } into calcKeys;
            }
        }
        return Group {
                    content: [
                        numberBackground,
                        numberText,
                        operationText,
                        memoryText,
                        Group {
                            translateY: transY
                            content: [calcKeys]
                            onKeyPressed: function(e: KeyEvent) {
                                KeyPressed(e);
                            }
                        }
                    ]
                }
    }

    var opCode = -1;
    var opNum1: Number = 0;
    var opNum2: Number = 0;
    var memNum: Number = 0 on replace {
        if (memNum != 0) {
            memory = "M";
        } else {
            memory = "";
        }
    }
    var decimal = false;
    var reset = false on replace {
        if (reset) { decimal = false; }
    }

    function getResult(): String {
        return numberText.content;
    }

    public function KeyPressed(e: KeyEvent) {
        if (e.code == KeyCode.VK_0 or e.code == KeyCode.VK_NUMPAD0) { onDigit(0); } else if (e.code == KeyCode.VK_1 or e.code == KeyCode.VK_NUMPAD1) { onDigit(1); } else if (e.code == KeyCode.VK_2 or e.code == KeyCode.VK_NUMPAD2) { onDigit(2); } else if (e.code == KeyCode.VK_3 or e.code == KeyCode.VK_NUMPAD3) { onDigit(3); } else if (e.code == KeyCode.VK_4 or e.code == KeyCode.VK_NUMPAD4) { onDigit(4); } else if (e.code == KeyCode.VK_5 or e.code == KeyCode.VK_NUMPAD5) { onDigit(5); } else if (e.code == KeyCode.VK_6 or e.code == KeyCode.VK_NUMPAD6) { onDigit(6); } else if (e.code == KeyCode.VK_7 or e.code == KeyCode.VK_NUMPAD7) { onDigit(7); } else if (e.code == KeyCode.VK_8 or e.code == KeyCode.VK_NUMPAD8) { onDigit(8); } else if (e.code == KeyCode.VK_9 or e.code == KeyCode.VK_NUMPAD9) { onDigit(9); } else if (e.code == KeyCode.VK_DECIMAL) { onDecimal(); } else if (e.code == KeyCode.VK_DELETE or e.code == KeyCode.VK_BACK_SPACE) { onCancel(); } else if (e.code == KeyCode.VK_ENTER) { onEquals(); } else if (e.code == KeyCode.VK_SUBTRACT) { onOperations("-", 16); } else if (e.code == KeyCode.VK_ADD) { onOperations("+", 15); } else if (e.code == KeyCode.VK_MULTIPLY) { onOperations("X", 14); } else if (e.code == KeyCode.VK_DIVIDE) { onOperations("/", 13); } else if (e.code == KeyCode.VK_LEFT) {
            selIndex--;
            if (selIndex < 0) { selIndex = 19; }
            setSelKey(selIndex);
        } else if (e.code == KeyCode.VK_RIGHT) {
            selIndex++;
            if (selIndex > 19) { selIndex = 0; }
            setSelKey(selIndex);
        } else if (e.code == KeyCode.VK_UP) {
            selIndex = selIndex - 4;
            if (selIndex < 0) { selIndex = 20 + selIndex; }
            setSelKey(selIndex);
        } else if (e.code == KeyCode.VK_DOWN) {
            selIndex = selIndex + 4;
            if (selIndex > 19) { selIndex = selIndex - 20; }
            setSelKey(selIndex);
        } else if (e.code == KeyCode.VK_EQUALS) {
            var key = calcKeys[selIndex];
            onKey(key);
        }
    }

    function onMousePressed(e: MouseEvent): Void {
        var key = e.node as Key;
        key.setCellFill(true);
        onKey(key);
    }

    function onKey(key: Key) {
        if (key.code >= 0 and key.code <= 9) {
            onDigit(key.code);
        } else if (key.code >= 10 and key.code <= 12) {
            onMemory(key.code);
        } else if (key.code == 19) {
            onDecimal();
        } else if (key.code == 17) {
            onEquals();
        } else if (key.code == 18) {
            onCancel();
        } else if (key.code >= 13 and key.code <= 16) {
            onOperations(key);
        }
    }

    function onDigit(keyCode: Integer) {

        if (reset) {
            number = "";
            reset = false;
        }
        var tempText = "{number}";
        if (tempText == "0") {
            tempText = "";
        }
        number = "{tempText}{keyCode}";
    }

    function onDecimal() {

        if (reset) {
            number = "0";
            reset = false;
        }
        if (not decimal) {
            number = "{number}.";
        }
        decimal = true;
    }

    function onCancel() {
        reset = true;
        opCode = -1;
        opNum1 = 0;
        opNum2 = 0;
        number = "0";
        operation = "";
        memNum = 0;
    }

    function onEquals() {
        performMathsOperation();
        opCode = -1;
        reset = true;
        operation = "";
    }

    function onOperations(key: Key) {
        operation = key.content;
        if (opCode == -1) {
            try {
                opNum1 = java.lang.Float.parseFloat(number);
            } catch (exp: java.lang.Exception) { }
            reset = true;
            opCode = key.code;
        } else {
            performMathsOperation();
        }
    }

    function onOperations(k: String, e: Integer) {
        operation = k;
        if (opCode == -1) {
            try {
                opNum1 = java.lang.Float.parseFloat(number);
            } catch (exp: java.lang.Exception) { }
            reset = true;
            opCode = e;
        } else {
            performMathsOperation();
        }
    }

    function performMathsOperation(): Void {
        reset = true;
        try {
            opNum2 = java.lang.Float.parseFloat(number);
        } catch (exp: java.lang.Exception) { }

        if (opCode == 13) {
            opNum1 = opNum1 / opNum2;
        } else if (opCode == 14) {
            opNum1 = opNum1 * opNum2;
        } else if (opCode == 15) {
            opNum1 = opNum1 + opNum2;
        } else if (opCode == 16) {
            opNum1 = opNum1 - opNum2;
        }
        number = "{opNum1}";
    }

    function onMemory(keyCode: Integer): Void {
        var tempNum = 0.00;
        try {
            tempNum = java.lang.Float.parseFloat(number);
        } catch (exp: java.lang.Exception) { }
        if (keyCode == 12) {
            if (opCode == -1) {
                opNum1 = memNum;
            } else {
                opNum2 = memNum;
            }
            number = "{memNum}";
            return;
        } else if (keyCode == 10) {
            memory = "M";
            memNum = memNum + tempNum;
        } else if (keyCode == 11) {
            memory = "M";
            memNum = memNum - tempNum;
        }
        opCode = -1;
        reset = true;
        operation = "";
    }

    function setSelKey(index: Integer) {
        for (key in calcKeys) {
            key.selected = false;
        }
        calcKeys[index].selected = true;
    }

}
