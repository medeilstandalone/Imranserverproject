package com.vanuston.medeil.ui.calendar.theme;

import javafx.scene.paint.Color;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.RadialGradient;
import javafx.scene.paint.Stop;
import javafx.scene.image.Image;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;

public class GrayTheme extends Theme {
    
    public override var background = LinearGradient {
        startX: 0.0,
        startY: 0.0,
        endX: 0.0,
        endY: FXCalendar.height
        proportional: false
        stops: [
            Stop {
                offset: 0
                color: Color.rgb(227, 226, 229)
            },
            Stop {
                offset: 0.2
                color: Color.rgb(201, 200, 206)
            }
        ]
    }
    
    public override var stroke = LinearGradient {
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
               offset: 0.2
               color: Color.GRAY
           }
        ]
    }
    
    public override var cellFill = Color.TRANSPARENT;
        
    public override var cellSelFill = RadialGradient {
        centerX: 0.5,
        centerY: 0.5,
        radius: 2
        stops: [
            Stop {
                offset: 0.0
                color: Color.rgb(25, 128, 229)
            },
            Stop {
                offset: 0.5
                color: Color.rgb(5, 53, 180)
            }
        ]
    }
    
    public override var cellStroke = Color.rgb(170, 174, 182);
    public override var cell3DStroke = Color.WHITE;

    public override var backArrowFill = LinearGradient {
        startX: 0.0,
        startY: 15.0,
        endX: 0.0,
        endY: 30.0
        proportional: false
        stops: [
            Stop {
                offset: 0.0
                color: Color.rgb(45, 57, 71)
            },
            Stop {
                offset: 0.5
                color: Color.GRAY
            },
            Stop {
                offset: 1.0
                color: Color.rgb(45, 57, 71)
            }
        ]
    }
    
    public override var nextArrowFill = LinearGradient {
        startX: 0.0,
        startY: 15.0,
        endX: 0.0,
        endY: 30.0
        proportional: false
        stops: [
            Stop {
                offset: 0.0
                color: Color.rgb(45, 57, 71)
            },
            Stop {
                offset: 0.5
                color: Color.GRAY
            },
            Stop {
                offset: 1.0
                color: Color.rgb(45, 57, 71)
            }
        ]
    }
        
    public override var foreground = Color.rgb(75, 93, 112);
    public override var selectedForeground = Color.WHITE;
    public override var dayForeground = Color.BLACK;
    public override var titleForeground = Color.rgb(75, 93, 112);

    public override var bgImage = Image { url: "{__DIR__}images/bg_gray.png" }
}
