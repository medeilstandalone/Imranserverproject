/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.util;
/**
 *
 * @author VANEmp025
 */
import java.io.*;
import javax.swing.filechooser.*;

public class DriveTypeInfo
{
 /*   public static void main(String[] args)
    {
        
        FileSystemView fsv = FileSystemView.getFileSystemView();
        File[] roots = fsv.getRoots();
        for (int i = 0; i < roots.length; i++)
        {
            System.out.println("Root: " + roots[i]);//14 println in 4 files
        }

        System.out.println("Home directory: " + fsv.getHomeDirectory());

        System.out.println("File system roots returned by File.listRoots():");
        File[] f = File.listRoots();
        for (int i = 0; i < f.length; i++)
        {
            System.out.println("Drive: " + f[i].getAbsolutePath());
            System.out.println("Display name: " + fsv.getSystemDisplayName(f[i]));
            System.out.println("Is drive: " + fsv.isDrive(f[i]));
            System.out.println("Is floppy: " + fsv.isFloppyDrive(f[i]));
            System.out.println("Readable: " + f[i].canRead());
            System.out.println("Writable: " + f[i].canWrite());
//            System.out.println("Total space: " + f[i].getTotalSpace());
//            System.out.println("Usable space: " + f[i].getUsableSpace());
        }
        System.getenv("SystemDrive");
    }*/
    public static String getAutoBackupPath(){

        File[] f = File.listRoots();
        String sysDrive = System.getenv("SystemDrive")+"\\";
        String getPath=sysDrive;
        for (int i = 0; i < f.length; i++)
        {
            if(!sysDrive.equalsIgnoreCase(f[i].getAbsolutePath()))
            {
                getPath = f[i].getAbsolutePath();
		break;
            }
        }
        return getPath;
    }
    public static String getDataDirPath(){
        String dataDrive = System.getenv("MedeilData");
        return dataDrive;
    }
}
