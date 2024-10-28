package com.vanuston.medeil.ui.calendar.theme;

import javafx.scene.paint.Paint;
import javafx.scene.paint.Color;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.image.Image;
import  com.vanuston.medeil.ui.calendar.view.FXCalendar;

public class BlueTheme extends Theme {
    override public var background:Paint = LinearGradient {
        startX: 0.0,
        startY: 0.0,
        endX: 0.0,
        endY: FXCalendar.height
        proportional: false
        stops: [
            Stop {
                offset: 0
                color: Color.BLACK
            },
            Stop {
                offset: 0.1
                color: Color.WHITE
            },
            Stop {
                offset: 0.2
                color: Color.web("#ddeff8")
//                color: Color.BLACK
            }
        ]
    }

    override public var stroke:Paint = LinearGradient {
        startX: 0.0,
        startY: 0.0,
        endX: 0.0,
        endY: FXCalendar.height
        proportional: false
        stops: [ 
            Stop { offset: 0 color: Color.web("#ddeff8") },
//            Stop { offset: 0 color: Color.BLACK },
            Stop { offset: 0.2 color: Color.BLACK }
        ]
    }
    override public var dateBGStroke:Paint = LinearGradient {
        startX: 10.0,
        startY: 20.0,
        endX: 10.0,
        endY: FXCalendar.height-50;
        proportional: true
        stops: [Stop { offset: 0 color: Color.BLACK }]
    }
    override public var cellFill:Paint = LinearGradient {
        startX: 0.0,
        startY: 0.3,
        endX: 0.0,
        endY: 28.0
        proportional: false
        stops: [
            Stop {
                offset: 0.0
                color: Color.BLACK
            },
            Stop {
                offset: 0.3
                color: Color.web("#ddeff8")
            },
            Stop {
                offset: 0.7
                color: Color.WHITE
            },
        ]
    }

    override public var cellSelFill:Paint = LinearGradient {
        startX: 0.0,
        startY: 0.3,
        endX: 0.0,
        endY: 28.0
        proportional: false
        stops: [
            Stop {
                offset: 0.0
                color: Color.rgb(5, 53, 180)
            },
            Stop {
                offset: 0.5
                color: Color.rgb(25, 128, 229)
            },
            Stop {
                offset: 1.0
                color: Color.web("#ddeff8")
//                color: Color.BLACK
            }
        ]
    }

    override public var cellStroke:Paint = Color.TRANSPARENT;
    override public var cell3DStroke:Paint = Color.TRANSPARENT;

   override  public var backArrowFill:Paint = LinearGradient {
        startX: 0.0,
        startY: 15.0,
        endX: 0.0,
        endY: 30.0
        proportional: false
        stops: [
            Stop {
                offset: 0.0
                color: Color.web("#ddeff8")
            },
            Stop {
                offset: 0.6
                color: Color.BLACK
            },
            Stop {
                offset: 1.0
                color: Color.WHITE
//                color: Color.web("#ddeff8")
            }
        ]
    }

    override public var nextArrowFill:Paint = LinearGradient {
        startX: 0.0,
        startY: 15.0,
        endX: 0.0,
        endY: 30.0
        proportional: false
        stops: [
            Stop {
                offset: 0.0
                color: Color.web("#ddeff8")
//                color: Color.WHITE
            },
            Stop {
                offset: 0.6
                color: Color.BLACK
            },
            Stop {
                offset: 1.0
//                color: Color.web("#ddeff8")
                color: Color.WHITE
            }
        ]
    }
            
    override public var foreground : Paint = Color.BLACK;

    override public var selectedForeground : Paint = Color.WHITE;
    override public var disabledForeground : Paint = Color.GREY;
    override public var dayForeground : Paint = Color.BLACK;
    override public var titleForeground : Paint = Color.BLACK;

    override public var bgImage = Image { url: "{__DIR__}images/bg_black.png" }
}
