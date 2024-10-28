
package com.vanuston.medeil.util;
var log: Logger = Logger.getLogger(WebLink.class,"Settings");

//Reditect to Medeil Web page
public function Medeil_Web():Void{
        try{
            launch_URI(GetCompanyInfo.web);
       }catch(e){
            log.debug("Class : WebLink Method :Medeil_Web() Error Occured while launcing mailto:contact@medeil.com : {e.getMessage()}");
        }
}
//Reditect to Medeil email address
public function Contact_Email():Void{
       try{
            launch_URI("mailto:{GetCompanyInfo.contact_mail}");
       }catch(e){
            log.debug("Class : WebLink Method :Contact_Email() Error Occured while launcing mailto:contact@medeil.com : {e.getMessage()}");
        }
}
//Reditect to Medeil support email address
public function Support_Email():Void{
       try{
            launch_URI("mailto:{GetCompanyInfo.support_mail}");
       }catch(e){
            log.debug("Class : WebLink Method :Support_Email() Error Occured while launcing mailto:contact@medeil.com : {e.getMessage()}");
        }
}
public function launch_URI(link:String):Void{
    java.awt.Desktop.getDesktop().browse(java.net.URI.create(link));
}
