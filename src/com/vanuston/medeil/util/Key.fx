package com.vanuston.medeil.util;

import javafx.scene.Node;
import javafx.scene.Group;
import javafx.scene.CustomNode;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import javafx.scene.shape.Rectangle;
import javafx.scene.paint.Color;
import javafx.scene.paint.Paint;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.input.MouseEvent;
import javafx.scene.paint.Color.*;

public def width = 50.0;
public def height = 37.0;

public class Key extends CustomNode {

    public var code = 0;
    public var selected = false;
    override var translateX = bind x;
    override var translateY = bind y;
    public def cellFill: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
                startY: 0.0
                endX: 0.0
                endY: 1.0
                stops: [
                    Stop { offset: 0.0, color: web("#e8e9e4") },
                    Stop { offset: 0.5, color: web("#d9dad7") },
                    Stop { offset: 1.0, color: web("#aeafac") },]
            }
    public var cellSelFill = LinearGradient {
                startX: 0.0,
                startY: 0.0,
                endX: 0.0,
                endY: 28.0
                proportional: false
                stops: [
                    Stop {
                        offset: 0.0
                        color: web("#cccccc");
                    },
                    Stop {
                        offset: 0.99
                        color: web("#606060");
                    }
                ]
            }
    var bgRect = Rectangle {
                x: 0
                y: 0
                width: width
                height: height
                fill: cellFill
                stroke: bind getStrokeColor(selected)
            };

    function getStrokeColor(selected: Boolean): Paint {
        if (selected) {
            return Color.DARKGRAY;
        } else {
            return Color.TRANSPARENT;
        }
    }

    var text: Text = Text {
                font: Font {
                    name: "Arial Bold"
                    size: 16
                }
                translateX: 21
                translateY: 17
                content: bind content
                fill: Color.BLACK
                y: 5
            }
    public var x = 0.0;
    public var y = 0.0;
    public var content = "0";

    override function create(): Node {
        return Group {
                    content: [
                        bgRect,
                        text
                    ]
                }
    }

    override var onMouseEntered = function(e:MouseEvent) {
        bgRect.fill = cellSelFill;
    }
    override var onMouseExited = function(e:MouseEvent) {
        bgRect.fill = cellFill;
    }

    public function setCellFill(selected: Boolean) {
        if (selected) {
            bgRect.fill = cellSelFill;
        } else {
            bgRect.fill = cellFill;

        }
    }

}
