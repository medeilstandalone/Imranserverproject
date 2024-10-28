/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.ui;

import javafx.animation.KeyFrame;
import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.paint.Paint;
import javafx.scene.text.Text;
import javafx.scene.text.TextOrigin;
import javafx.scene.shape.Rectangle;
import javafx.animation.Timeline;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.scene.paint.Color;

public class TextScroll extends CustomNode
{
    var screenLX=180.0;


    public var x: Number =screenLX;
    public var y: Number=bind CommonDeclare.ScreenHeight-18;
    public var width: Number;
    public var height: Number;
    public var stroke: Paint;
    public var strokeWidth: Number;
    public var delay = 6ms;
    public var txtWidth1=100.0;
    var scrollingText: Text;

    public var text: String on replace
    {

        if (isScrollingText ())
            scrollingText.translateY = 0.0;
    }
    override public function create(): Node
    {
        Group
        {
            content:
            [
                scrollingText = Text
                {
                    content: bind text
                    textOrigin: TextOrigin.TOP
                    x: bind x
                    y: bind y
                    style : "font-family:Arial;font-size: 8pt;font-weight:bold;"
                    fill : Color.WHITE
                }
            ]
            clip: Rectangle
            {
                x: screenLX
                y: y
                width: bind width
                height: bind height
            }
        }
    }

    public function isScrollingText ()
    {
        autoTimer1.running
    }

    public function scrollUp (num:Number)
    {
        txtWidth1=num;

       autoTimer1.play();
    }

    public function stopScrolling ()
    {
        autoTimer1.stop ()
    }

     var autoTimer = Timeline
    {
        repeatCount: Timeline.INDEFINITE

        keyFrames:
        [
            KeyFrame
            {
                time: delay
                action: function ()
                {
                    if (scrollingText.translateY+height < 0)
                    {
                        scrollingText.translateY = 0.0;
                        return
                    }
                    scrollingText.translateY -= 0.5
                }
            }
        ]
    }

      var autoTimer1 = Timeline
    {
        repeatCount: Timeline.INDEFINITE

        keyFrames:
        [
            KeyFrame
            {
                time: delay
                action: function ()
                {

                    if (scrollingText.translateX+txtWidth1< 0)
                    {
                        scrollingText.translateX = 0.2;
                        return
                    }
                    scrollingText.translateX -= 0.3
                }
            }
        ]
    }


}