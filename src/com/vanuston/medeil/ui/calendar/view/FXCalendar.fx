package com.vanuston.medeil.ui.calendar.view;

import javafx.scene.Node;
import javafx.scene.Group;
import javafx.scene.CustomNode;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import javafx.scene.text.TextOrigin;
import javafx.scene.shape.Path;
import javafx.scene.shape.MoveTo;
import javafx.scene.shape.LineTo;
import javafx.scene.shape.Rectangle;
import javafx.scene.paint.Color;
import javafx.scene.input.MouseEvent;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.KeyCode;
import java.util.Calendar;
import javafx.scene.text.TextAlignment;
import  com.vanuston.medeil.ui.calendar.theme.BlueTheme;
import  com.vanuston.medeil.ui.calendar.theme.GrayTheme;
import  com.vanuston.medeil.ui.calendar.theme.Theme;


public def width = 221;
public def height = 249;


public class FXCalendar extends CustomNode {

    public var selectedDay:Integer;
    public var selectedMonth:Integer;
    public var selectedYear:Integer;
    
    public var theme = Theme { };
    public var dateGroup:Group;
    var themeToggle = 0;
    
    var insets = 10.0;
        
    var calendar : Calendar = Calendar.getInstance();
    
    var date: Integer;
    var month: Integer;
    var year: Integer;
    var selCellIndex = 0;

    var themeRect : Rectangle = Rectangle {
        x: 5 
	y: 5
        width: bind width - 10
        height: 8
        fill: Color.WHITE
        strokeWidth: 3.0
        arcWidth: 5
        arcHeight: 5
        opacity: 0.2
        onMouseEntered: function(e:MouseEvent) {
            themeRect.opacity = 0.5;
        }
        onMouseExited: function(e:MouseEvent) {
            themeRect.opacity = 0.2;
        }
        onMousePressed: function(e:MouseEvent) {
            if(themeToggle==0){
                  theme = BlueTheme{};
                themeToggle=1;
            }else if(themeToggle==1) {
                theme = GrayTheme{};
                themeToggle=2;
            }
            else if(themeToggle==2){
                theme = Theme{};
                themeToggle=0;
            }
        calendar.setTime(new java.util.Date());
        set(calendar.get(Calendar.YEAR),calendar.get(Calendar.MONTH),calendar.get(Calendar.DATE));
        }
    };
            
    var bgRect = Rectangle {
        x: 2 
	y: 2
        width: bind width - 4
        height: bind height - 4
        fill: bind theme.background
        stroke: bind theme.stroke
        strokeWidth: 3.0
        arcWidth: 10
        arcHeight: 10
    };
    
    var monthYearText : Text = Text { 
        translateX: width/4 + 10
        translateY: insets*1.8
        textAlignment:TextAlignment.LEFT;
        font:Font {
            name: "Arial Bold"

//            name: "Bitstream Vera Sans Bold"
            size: 13
        }
        fill: bind theme.titleForeground
        textOrigin: TextOrigin.TOP
    };

    var dateBGRect : Rectangle = Rectangle{
        x: 11
	y: 9
        width: bind width - 23
        height: bind height - 48
        fill: bind theme.background
//        fill: Color.WHITE
        stroke: bind theme.dateBGStroke
        strokeWidth: 2.0
        arcWidth: 10
        arcHeight: 10
    }

    var layOutX = monthYearText.layoutX;

    var backButton : Path = Path {
                elements: [
            MoveTo { x: 35  y: 22 },
            LineTo { x: 44  y: 15 },
            LineTo { x: 44  y: 30 },
            LineTo { x: 35  y: 22 }
        ]
        fill: bind theme.backArrowFill
        stroke: Color.TRANSPARENT
        smooth: true
        opacity: 0.6
        onMouseEntered:function(e:MouseEvent) {
            backButton.opacity = 1.0;
        }
        onMouseExited:function(e:MouseEvent) {
            backButton.opacity = 0.6;
        }
        onMousePressed:function(e:MouseEvent) {
            if(month == 0) {
                month = 11; year = year - 1;
            } else {
                month = month - 1;
            }
            if(month==8)
            {
                monthYearText.layoutX=layOutX-10;
            }else monthYearText.layoutX=layOutX;
            set(year, month, 1);
        }
    };
    
    var backYearButton : Path = Path {
        elements: [
            MoveTo { x: 15  y: 22 },
            LineTo { x: 26  y: 15 },
            LineTo { x: 26  y: 30 },
            LineTo { x: 15  y: 22 }
        ]
        fill: bind theme.backArrowFill
        stroke: Color.TRANSPARENT
        smooth: true
        opacity: 0.5
        onMouseEntered:function(e:MouseEvent) {
            backYearButton.opacity = 1.0;
        }
        onMouseExited:function(e:MouseEvent) {
            backYearButton.opacity = 0.5;
        }
        onMousePressed:function(e:MouseEvent) {
            year-=1;
            set(year, month, 1);
        }
    };

    var nextButton : Path = Path {
        elements: [
            MoveTo { x: 174  y: 15 },
            LineTo { x: 185  y: 22 },
            LineTo { x: 174  y: 30 },
            LineTo { x: 174  y: 15 }
        ]
        fill: bind theme.nextArrowFill
        stroke: Color.TRANSPARENT
        smooth: true
        opacity: 0.6
        onMouseEntered:function(e:MouseEvent) { 
            nextButton.opacity = 1.0;
        }
        onMouseExited:function(e:MouseEvent) { 
            nextButton.opacity = 0.6;
        }
        onMousePressed:function(e:MouseEvent) {
            if(month == 11) {
                month = 0; year = year + 1;
            } else {
                month = month + 1;
            }
            if(month>=2 and month<=6)
            {
                monthYearText.layoutX=layOutX+10;
            }
            else if(month==8)
            {
                monthYearText.layoutX=layOutX-10;
            }else monthYearText.layoutX=layOutX;
            set(year, month, 1);
        }
    }

    var nextYearButton : Path = Path {
        elements: [
            MoveTo { x: 194  y: 15 },
            LineTo { x: 205  y: 22 },
            LineTo { x: 194  y: 30 },
            LineTo { x: 194  y: 15 }
        ]
        fill: bind theme.nextArrowFill
        stroke: Color.TRANSPARENT
        smooth: true
        opacity: 0.6
        onMouseEntered:function(e:MouseEvent) {
            nextYearButton.opacity = 1.0;
        }
        onMouseExited:function(e:MouseEvent) {
            nextYearButton.opacity = 0.6;
        }
        onMousePressed:function(e:MouseEvent) {
            year = year + 1;
            set(year, month, 1);
        }
    }

    public var dateCells:Cell[];                                           // Date Cells
    //@return selected date in mm/d/yyyy format
    public function getDate():String {
        return "{(month + 1)}/{date}/{year}"
    }

    //Set specified date, month, year as selected date
    public function set(year:Integer, month:Integer, date:Integer) {
        this.date = date;
        this.month = month;
        this.year = year;
                
        // Set Calendar Date
        calendar.set(Calendar.DAY_OF_MONTH, date);
        calendar.set(Calendar.MONTH, month);
        calendar.set(Calendar.YEAR, year);

        selectedDay=this.date;
        selectedMonth=this.month;
        selectedYear=this.year;
        
        // Set Month and Date
        monthYearText.content = "{toMonthText(month)} {year}";
        if(month>=2 and month<=6)
        {
            monthYearText.layoutX=layOutX+12;
        }
        else if(month==8)
        {
            monthYearText.layoutX=layOutX-10;
        }else monthYearText.layoutX=layOutX;
        
        // Start days from Monday
        calendar.set(Calendar.DATE, 1);
        var dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
        var dayOfMonth = dayOfWeek;

        if(dayOfWeek <= 1) { dayOfMonth = 7 + dayOfWeek; }          //If its Sunday/Monday, display one week from last month
        addDays(-dayOfMonth);
                
        // Populate Date Cells
        for(cell in dateCells) {
            addDays(1);
            cell.date = calendar.get(Calendar.DAY_OF_MONTH);
            cell.month = calendar.get(Calendar.MONTH);
            cell.year = calendar.get(Calendar.YEAR);
            cell.currentMonth = (calendar.get(Calendar.MONTH) == month);
            cell.selected = (calendar.get(Calendar.DATE) == date);
            if(cell.selected and cell.currentMonth) {
                selCellIndex = cell.index;
            }
        }
    }
        
    /**
     * Since Calendar.add(int field, int amount) is not available in MIDP (JSR 118),
     * we cannot use the API while writing application for Common Profile.
     * Below code provides implementation for add using set method.
     */
    function addDays(days : Integer) {
        calendar.setTime(new java.util.Date(
            calendar.getTime().getTime() + days * 86400000));
    }


    override function create():Node {
	      theme = GrayTheme{};
          themeToggle=2;
        var days = [ "Su", "Mo", "Tu", "We", "Th", "Fr", "Sa" ];    // Set Text Monday To Sunday
        var dayCells:Cell[];                                        // Initialize Calendar Day Cells
        for(i in [0..6]) {
            insert Cell { 
                x: bgRect.x + (Cell.width * i) + insets
                y: insets
                content: days[i]
                isDate: false
                theme: bind theme

            } into dayCells;
        }
        var index = 0;                                              // Initialize Calendar Date Cells

        for(row in [0..5]) {
            for(col in [0..6]) {
                insert Cell { 
                    x: bgRect.x + (Cell.width * col) + insets
                    y: (Cell.height * (row + 1)) + insets
                    index: index
                    theme: bind theme
                    onMousePressed: function(e:MouseEvent) {
                       var cell = e.node as Cell;
                         selectedDay=cell.date;selectedMonth=cell.month;selectedYear=cell.year;
                        set(cell.year, cell.month, cell.date);
                        getSelectedDate();
                        this.visible=false;
                    }
                } into dateCells;
                index++;
            }
        }
        
        // Set current date as selected date
        calendar.setTime(new java.util.Date());
        set(calendar.get(Calendar.YEAR), 
            calendar.get(Calendar.MONTH), 
            calendar.get(Calendar.DATE));
        dateGroup=Group {
                    translateY: 30.0
                    content: [ dateBGRect,dayCells, dateCells ]
                    }
        return Group {
            content:  [bgRect, themeRect,monthYearText, backButton,backYearButton, nextButton,nextYearButton,dateGroup]
        }
    }
    public function getSelectedDate():String{
        var selDate: String;
        if(date>9)
        {
            if(month>8)
            {
                selDate="{date}-{month+1}-{year}";
            }
            else{
                selDate="{date}-0{month+1}-{year}";
            }
        }
        else
        {
            if(month>8)
            {
                selDate="0{date}-{month+1}-{year}";
            }
            else{
                selDate="0{date}-0{month+1}-{year}";
            }
        }
        return selDate
        }


    def monthText = ["January", "February", "March","April","  May"," June"," July","August","September","October","November","December"];
    function toMonthText(m: Integer) {
        return monthText[m];
    }

    override var onKeyPressed = function(e : KeyEvent) {
        if(e.code == KeyCode.VK_LEFT) {
            selCellIndex--;
            var cell = dateCells[selCellIndex];
            set(cell.year, cell.month, cell.date);
            
        } else if(e.code == KeyCode.VK_RIGHT) {
            selCellIndex++;
            var cell = dateCells[selCellIndex];
            set(cell.year, cell.month, cell.date);
        } else if(e.code == KeyCode.VK_UP) {
            var tempIndex = selCellIndex - 7;
            if(tempIndex < 0) { return; }
            selCellIndex = tempIndex;
            var cell = dateCells[selCellIndex];
            set(cell.year, cell.month, cell.date);
        } else if(e.code == KeyCode.VK_DOWN) {
            var tempIndex = selCellIndex + 7;
            if(tempIndex > 41) { return; }
            selCellIndex = tempIndex;
            var cell = dateCells[selCellIndex];
            set(cell.year, cell.month, cell.date);
        }
    }
}
