
package com.vanuston.medeil.util;
import java.io.File;
import java.lang.Runtime;
import java.lang.Exception;
import javafx.util.Properties;
import java.io.FileInputStream;
import java.io.FileOutputStream;



var log: Logger = Logger.getLogger(Tools.class, "Utilities");
public var SysResolution:Integer[];
 public function Help():Void{
        LoadFile("MedeilHelp.chm");
 }


  public function ShortCutLoader():Void{
        LoadFile("PMS Version 1.0 - Shortcut Keys_December_2011.pdf");
 }


 public function EnglishManual():Void{
        LoadFile("PMS Version 1.0 - User Manual.pdf");
}
 public function Tips():Void{
        LoadFile("PMS Version 1.0 - FAQs & Troubleshooting Guide.pdf");
 }
 public function LaunchMedeil():Void{
        LoadFile("Medeil.exe");
 }
  public function LaunchActivator(val:Integer):Void{
        LoadFile("Medeil_Activator.exe");
        if(val==0){Medeil_Exit();}
 }
  public function LaunchMedeil_Reports():Boolean{
       var result:Boolean;
    try {
    var path: String = new File(".").getCanonicalPath().toString();
    var prop: Properties = new Properties();
    prop.load(new FileInputStream("{path}/config/config.properties"));
    if (prop.get("Medeil_Reports_Running").equals("1")) {
        result = true;
         } else {
        LoadFile("Medeil_Reports.exe");
        prop.put("Medeil_Reports_Running", "1");
        prop.store(new FileOutputStream("{path}/config/config.properties"));
        result = false;
         }
     } catch (e) {
          log.debug("Class : Tools Method : LaunchMedeil_Reports() Unable to LanchMedeil_Reports.Exception : {e.getMessage()}");

     }
        return result;
    }
   public function Reset_Reports_Launch():Void{
    try {
        var path: String = new File(".").getCanonicalPath().toString();
        var prop: Properties = new Properties();
        prop.load(new FileInputStream("{path}/config/config.properties"));
        prop.put("Medeil_Reports_Running", "0");
        prop.store(new FileOutputStream("{path}/config/config.properties"));
     } catch (e) {
        log.debug("Class : Tools Method : Reset_Reports_Launch() Exception : {e.getMessage()}");
     }
    }
function LoadFile(path:String):Void{
        try
        {
           var  FilePath:String="{new File(".").getCanonicalFile()}\\{path}";

            log.debug("Class : Tools Method : LoadFile() File path : {FilePath}");
            if(new File(FilePath).exists())
            {
                Runtime.getRuntime().exec("rundll32 url.dll,FileProtocolHandler {FilePath}");

             }else{
                 log.debug("Class : Tools Method : LoadFile() Unable to load file.Check file path : {FilePath}");
             }
        }
        catch (e:Exception)
        {
        log.debug(e);
     }
}

 public function CheckUpdate():Void{
        LoadFile("Medeil_updater.exe");
    }

public function ResolutionUpdater():Void{
try {
{
     Runtime.getRuntime().exec("RC.exe /X 1024 /Y 768");
 }
  } catch (e) {
       log.debug("Class : Tools Method : ResolutionUpdater() Exception: {e.getMessage()}");
 }

}
public function Medeil_Exit():Void{
try {
{
     Runtime.getRuntime().exec("RC.exe /X {SysResolution[0]} /Y {SysResolution[1]}");
     javafx.lang.FX.exit();
 }
  } catch (e) {
       log.debug("Class : Tools Method : Medeil_Exit() Exception: {e.getMessage()}");
       javafx.lang.FX.exit();
 }
}
