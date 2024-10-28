package com.vanuston.medeil.ui.calendar.theme;

import javafx.scene.paint.Paint;
import javafx.scene.paint.Color;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.image.Image;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;

public class Theme {
    public var background:Paint = LinearGradient {
        startX: 0.0,
        startY: 0.0,
        endX: 0.0,
        endY: FXCalendar.height
        proportional: false
        stops: [
            Stop {
                offset: 0
                color: Color.GRAY
            },
            Stop {
                offset: 0.2
                color: Color.BLACK
            }
        ]
    }

    public var stroke:Paint = LinearGradient {
        startX: 0.0,
        startY: 0.0,
        endX: 0.0,
        endY: FXCalendar.height
        proportional: false
        stops: [ 
            Stop { offset: 0 color: Color.BLACK },
            Stop { offset: 0.2 color: Color.GRAY }
        ]
    }
    public var dateBGStroke:Paint = LinearGradient {
        startX: 0.0,
        startY: 0.0,
        endX: 0.0,
        endY: FXCalendar.height
        proportional: false
        stops: [Stop { offset: 0 color: Color.GRAY }]
    }

    public var cellFill:Paint = LinearGradient {
        startX: 0.0,
        startY: 0.3,
        endX: 0.0,
        endY: 28.0
        proportional: false
        stops: [
            Stop {
                offset: 0.0
                color: Color.GRAY
            },
            Stop {
                offset: 0.5
                color: Color.BLACK
            }
        ]
    }

    public var cellSelFill:Paint = LinearGradient {
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
                color: Color.BLACK
            }
        ]
    }

    public var cellStroke:Paint = Color.TRANSPARENT;
    public var cell3DStroke:Paint = Color.TRANSPARENT;

    public var backArrowFill:Paint = LinearGradient {
        startX: 0.0,
        startY: 15.0,
        endX: 0.0,
        endY: 30.0
        proportional: false
        stops: [
            Stop {
                offset: 0.0
                color: Color.WHITE
            },
            Stop {
                offset: 0.5
                color: Color.GRAY
            },
            Stop {
                offset: 1.0
                color: Color.WHITE
            }
        ]
    }

    public var nextArrowFill:Paint = LinearGradient {
        startX: 0.0,
        startY: 15.0,
        endX: 0.0,
        endY: 30.0
        proportional: false
        stops: [
            Stop {
                offset: 0.0
                color: Color.WHITE
            },
            Stop {
                offset: 0.5
                color: Color.GRAY
            },
            Stop {
                offset: 1.0
                color: Color.WHITE
            }
        ]
    }
            
    public var foreground : Paint = Color.WHITE;
    public var selectedForeground : Paint = Color.WHITE;
    public var disabledForeground : Paint = Color.GRAY;
    public var dayForeground : Paint = Color.WHITE;
    public var titleForeground : Paint = Color.WHITE;

    public var bgImage = Image { url: "{__DIR__}images/bg_black.png" }
}
