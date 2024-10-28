package com.vanuston.medeil.ui.calendar.view;

import javafx.scene.Node;
import javafx.scene.Group;
import javafx.scene.CustomNode;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import javafx.scene.text.TextOrigin;
import javafx.scene.shape.Rectangle;
import javafx.scene.paint.Paint;
import javafx.scene.paint.Color;
import javafx.scene.shape.Line;
import javafx.scene.image.ImageView;

import  com.vanuston.medeil.ui.calendar.theme.Theme;

public def width = 28.0;
public def height = 28.0;

public class Cell extends CustomNode {

    public var x = 0.0;
    public var y = 0.0;    
    public var isDate = true;
    public var index : Integer = -1;

    var cellSelColor : Paint = Color.TRANSPARENT;
    public var theme = Theme { } on replace {
        if(selected and currentMonth) {
            cellSelColor = theme.cellSelFill;
        } else {
            cellSelColor = theme.cellFill;
        }
    }
    
    override var translateX = bind x;
    override var translateY = bind y;

    var horzLine = Line {
        startX: 1 
	startY: 1
        endX: width - 1 
	endY: 1
        stroke: bind theme.cell3DStroke
        visible: bind not (selected and currentMonth)
    }
    var vertLine = Line {
        startX: width - 1 
	startY: 1
        endX: width - 1 
	endY: height - 1
        stroke: bind theme.cell3DStroke
        visible: bind not (selected and currentMonth)
    }

    var text:Text = Text {
        font:Font {
            name: "Arial Bold"
//            name: "sansserif"
            size: 11

        }
        translateX: 8
        translateY: 10
        textOrigin: TextOrigin.TOP
        content: bind content
        fill: bind getTextColor(selected, currentMonth, theme)
    };
    
    function getTextColor(sel : Boolean, curMon : Boolean, theme: Theme) : Paint {
        
        if(not isDate) { return theme.dayForeground; }
        
        if(sel and curMon) { 			// Selected date from current month
            return theme.selectedForeground;
        } else if(curMon) { 			// Selected Month
            return theme.foreground;
        } else { 				// Day from next or previous month
            return theme.disabledForeground;
        }
    };
    
    public var currentMonth: Boolean = false;
    public var selected: Boolean = false on replace {
        if(selected and currentMonth) {
            cellSelColor = theme.cellSelFill;
        } else {
            cellSelColor = theme.cellFill;
        }
    }
    
    public var content = "0";
    public var date: Integer on replace {
        if(date > 0) {
            content = "{date}";
        }
    };
    public var month: Integer = 0;
    public var year: Integer = 0;
        
    var bgRect : javafx.scene.Node;
    var selRect = Rectangle {
            x: 0 
	    y: 0
            width: bind width
            height: bind height
            fill: bind cellSelColor
        };
    
    override function create() : Node {
        
        var isMobile = (FX.getProperty("javafx.me.profiles") != null);
        
        if(isMobile and (theme.bgImage != null)) { // Use Image
            bgRect = ImageView {
                x: 0 y: 0 
                image: bind theme.bgImage
            };
        } else {
            bgRect = Rectangle {
                x: 0 y: 0 
                width: bind width 
                height: bind height
                stroke: bind theme.cellStroke
                fill: bind theme.cellFill
            };
        }
                
        return Group {
            content: [ bgRect, selRect, horzLine, vertLine, text ]
        }
    }
}
