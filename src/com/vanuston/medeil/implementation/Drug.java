/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.implementation;

/**
 *
 * @author Administrator
 */
import com.vanuston.medeil.model.DrugModel;
import java.rmi.RemoteException;
import java.util.ArrayList;

public interface Drug extends BaseImplements {
    ArrayList<DrugModel> viewAllRecord (Object drugBean) throws RemoteException;
    ArrayList<DrugModel> SearchRecord (Object drugBean) throws RemoteException;
}
